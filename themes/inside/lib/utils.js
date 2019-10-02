const crypto = require('crypto');

exports.type = function (o) {
  return Object.prototype.toString.call(o).split(' ')[1].slice(0, -1).toLowerCase()
}

exports.isObject = function (obj) {
  return exports.type(obj) === 'object';
}

exports.isEmptyObject = function (obj) {
  if (!exports.isObject(obj)) return false;

  for (const key in obj) return false;
  return true;
}

exports.pick = function (obj, keys) {
  if (keys === undefined) {
    keys = obj;
    return process;
  }

  return process(obj);

  function process(o) {
    o = Object.assign({}, o);
    let ret = {};

    keys.forEach(key => {
      o.hasOwnProperty(key) &&
        // delete property with value `false` to save some bytes
        (o[key] !== false && o[key] !== undefined && o[key] !== null) &&
        (ret[key] = o[key]);

    });

    if (ret.tags) {
      if (ret.tags.length) ret.tags = ret.tags.sort('name').map(tag => tag.name);
      else delete ret.tags;
    }
    if (ret.categories) {
      if (ret.categories.length) ret.categories = ret.categories.sort('name').map(cat => cat.name);
      else delete ret.categories;
    }
    if (ret.prev) ret.prev = { title: ret.prev.title, link: ret.prev.link };
    if (ret.next) ret.next = { title: ret.next.title, link: ret.next.link };

    return ret;
  }
}

exports.md5 = function (str, len = 20) {
  return crypto.createHash('md5').update(str).digest('hex').substring(0, len);
}

exports.base64 = function (str) {
  return Buffer.from(str).toString('base64').replace(/=/g, '');
}

/**
 * Remove `/*.html`
 *
 * @param {string} url
 * @param {boolean} keepIndex keep `index` for `index.html`, used for post_asset_folder
 * @returns {string}
 */
exports.trimHtml = function (url, keepIndex) {
  if (!url) return '';
  url = url.split('/')

  const last = url.pop()
  if (last) {
    if (last === 'index.html') {
      if (keepIndex) url.push('index')
    } else {
      url.push(last.split('.')[0])
    }
  }

  return url.join('/');
}

exports.Pagination = class {
  /**
   * @param {any} config
   */
  constructor(config) {
    this.config = Object.assign(config);
  }

  /**
   * @param {any[]} posts
   * @param {{ perPage: number; id?: string | Function; extend?: object; dataFn?: Function; }} options
   * @param {(Array<{ type: 'html' | 'json'; dataFn?: Function; id: string | Function; extend?: object }>)} generationMeta
   * @returns {Array<{ path: string; layout?: string; data: any }>}
   */
  apply(posts, options, generationMeta) {
    const len = posts.length;
    const perPage = options.perPage == undefined ? 10 : options.perPage == 0 ? len : +options.perPage;
    const total = Math.ceil(len / perPage);
    const ret = [];

    // Merge options into meta
    const commonProps = ['id', 'dataFn'];
    generationMeta = generationMeta.map(meta => {
      commonProps.forEach(prop => {
        if (meta[prop] === undefined && options[prop] !== undefined) meta[prop] = options[prop];
      });
      meta.extend = Object.assign({}, options.extend || {}, meta.extend || {});

      return meta;
    })

    for (let i = 1; i <= total; i++) {
      const data = {
        per_page: perPage,
        total,
        current: i,
        data: posts.slice((i - 1) * perPage, i * perPage)
      };

      ret.push(generationMeta.map(meta => this._merge(i, data, meta)))
    }

    return ret;
  }

  /**
   * @param {number} index
   * @param {object} data
   * @param {({ type: 'html' | 'json'; layout?: string; dataFn?: Function; id: string | Function; extend?: object })} meta
   * @returns {{ path: string; layout?: string; data: any }}
   */
  _merge(index, data, meta) {
    const type = meta.type;
    const base = this.config[type];

    if (!base) return;

    const dataFn = meta.dataFn || (o => o);
    const pathFn = meta.pathFn || (o => o);
    const layout = meta.layout || base.layout;
    const extend = meta.extend || {};
    const id = typeof meta.id === 'function' ?
      meta.id :
      (index => (meta.id || '') + (index === 1 ? '' : `/${index}`));

    return base.generateFn({
      path: pathFn(id(index)),
      layout,
      data: dataFn(Object.assign(data, extend))
    })
  }
}

/**
 * Parses toc of post
 *
 * @param {string} content
 * @param {number} depth
 * @returns {Array<{title: string; id: string; index: string; children?: any[]}>}
 */
exports.parseToc = function (content, depth) {
  if (!content || !depth) return [];
  if (depth > 4) depth = 4;
  if (depth < 1) depth = 3;

  const reg = [
    /^<h1.*id="([^"]*)"[^>]*>(.*)<a /,
    /^<h2.*id="([^"]*)"[^>]*>(.*)<a /,
    /^<h3.*id="([^"]*)"[^>]*>(.*)<a /,
    /^<h4.*id="([^"]*)"[^>]*>(.*)<a /,
    /^<h5.*id="([^"]*)"[^>]*>(.*)<a /,
  ].slice(0, depth + 1),
    headings = content.match(/<(h[12345]).*?id="([^"]*)".*?>(.*?)<a.*?<\/\1>/g);

  if (!headings) return [];

  // Default will start from heading1, start from heading2 if failed
  if (!test(headings).length) reg.shift();
  // Pops up the last reg to ensure toc matches the specified depth
  else if (reg.length === depth + 1) reg.pop();

  return test(headings);

  function test(block, pointer = 0, code = '') {
    if (!reg[pointer]) return [];

    const splited = split(block, reg[pointer]);

    return splited.map((b, i) => {
      const index = (code ? code + '.' : '') + (i + 1),
        [, id, title] = b[0].match(reg[pointer]),
        out = { title, id, index },
        children = test(b.slice(1), pointer + 1, index);

      // strip anchor href
      out.title = out.title.replace(/ href=(['"])[^\1]*\1/g, '')

      if (children.length)
        out.children = children;

      return out;
    }
    );
  }

  /**
   * Return paired slicer
   *
   * @param {string[]} target
   * @param {RegExp} reg
   * @returns {string[][]}
   */
  function split(target, reg) {
    const recorder = [],
      slicer = [],
      output = [];

    target.forEach((line, index) => {
      if (line.match(reg)) {
        recorder.push(index);
      }
    }
    );

    recorder.push(target.length);

    for (let i = 0, len = recorder.length; i < len; i++) {
      if (i + 1 === len) break;
      slicer.push([recorder[i], recorder[i + 1]]);
    }

    slicer.forEach(indexs => {
      output.push(target.slice.apply(target, indexs));
    })

    return output;
  }
}


/**
 *  This is a non-standard and partial implementation of json schema draft-07,
 *  therefore can not be used else where
 *
 * @param {*} schema
 * @param {*} data
 * @param {*} payload
 */
exports.parseConfig = function (schema, data, payload = {}) {
  // https://github.com/epoberezkin/ajv/blob/master/lib/compile/formats.js
  const regexs = {
    date: /^\d\d\d\d-[0-1]\d-[0-3]\d$/,
    // uri: /^(?:[a-z][a-z0-9+-.]*:)(?:\/?\/)?[^\s]*$/i,
    // 'uri-reference': /^(?:(?:[a-z][a-z0-9+-.]*:)?\/?\/)?(?:[^\\\s#][^\s#]*)?(?:#[^\\\s]*)?$/i,
    email: /^[a-z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?(?:\.[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?)*$/i,
    regex: (str) => {
      if (/[^\\]\\Z/.test(str)) return false;
      try {
        new RegExp(str);
        return true;
      } catch (e) {
        return false;
      }
    }
  };
  const { type, isEmptyObject } = exports;
  const definitions = {}
  const parsed = parse(schema, data, '#');
  return parsed.value !== undefined ? parsed.value : parsed.hint;

  /**
   *
   * @param {*} sub   schema
   * @param {*} subv  value for validation
   * @param {*} paths used for definitions
   */
  function parse(sub, subv, paths) {
    // merge definitions
    if (sub.definitions) {
      for (const defKey in sub.definitions) {
        definitions[sub.definitions[defKey].$id || paths + '/definitions/' + defKey] = sub.definitions[defKey];
      }
    }

    const ret = {
      hint: payload[sub.default] !== undefined ? payload[sub.default] : sub.default
    }

    if (sub.$ref) {
      if (!definitions[sub.$ref]) return ret;
      // same floor
      return parse(definitions[sub.$ref], subv, paths);
    }

    const sType = sub.type;
    let vType = type(subv);

    // Will be assignd to a new value if subv is not a primitive value
    let safeSubv = subv;

    // object can hold a `required` key, to ensure the correct hint can be dug,
    // `subv` must be an object
    if (sType === 'object' && vType !== 'object') {
      if (sub.required) {
        subv = {}
        vType = sType
      } else return ret
    }

    // enum may not hold a type property
    if (sub.enum) {
      // enum only accepts primitive values
      // simply uses `Array.indexOf()`
      if (!~sub.enum.indexOf(subv)) return ret
    }
    else if (sType && sType !== vType) return ret
    else if (sType === 'string') {
      // minLength
      if (sub.minLength !== undefined && subv.length < sub.minLength) return ret
      // maxLength
      if (sub.maxLength !== undefined && subv.length > sub.maxLength) return ret
      // pattern
      if (sub.pattern && !new RegExp(sub.pattern).test(subv)) return ret
      // format
      if (sub.format) {
        const regex = regexs[sub.format];
        const passed = regex ? typeof regex === 'function' ? regex(subv) : new RegExp(regex).test(subv) : true;
        if (!passed) return ret
      }
    }
    else if (sType === 'number') {
      // minimum
      if (sub.minimum !== undefined && subv < sub.minimum) return ret
      // maximum
      if (sub.maximum !== undefined && subv > sub.maximum) return ret
    }
    else if (sType === 'boolean') {
      // nothing to do
    }
    else if (sType === 'object' ||
      sub.properties !== undefined || // properties implicit object type
      sub.additionalProperties !== undefined // additionalProperties implicit object type
    ) {
      // if (ret.hint === undefined) ret.hint = {}

      const trunk = {}
      const required = sub.required || []
      const properties = sub.properties || {}
      const allKeys = Array.from(new Set(Object.keys(subv || {}).concat(Object.keys(properties))));
      for (const key of allKeys) {
        // A specific schema for [key]
        if (properties[key] !== undefined) {
          trunk[key] = parse(properties[key], subv[key], paths + '/properties/' + key)
        }
        else {
          if (sub.patternProperties) {
            for (const pkey in sub.patternProperties) {
              if (new RegExp(pkey).test(key)) {
                // Do not put definitions inside a patternProperties
                trunk[key] = parse(sub.patternProperties[pkey], subv[key], paths + '/properties/' + key)
                continue;
              }
            }
          }

          if (sub.additionalProperties !== undefined) {
            // fail
            if (sub.additionalProperties === false) {
              // if (strict) return ret
            } else {
              trunk[key] = parse(sub.additionalProperties, subv[key], paths + '/additionalProperties/' + key)
            }
          }
          else {
            trunk[key] = {
              value: subv[key],
              pass: true
            }
          }
        }

        // propertyNames is missing
      }

      // properties with valid name can goes here
      // Note a standard implementation may failed aleady

      // required
      for (const rkey of required) {
        if (!trunk[rkey].pass && trunk[rkey].hint === undefined) return ret
      }

      // combine values
      safeSubv = {}
      for (const key in trunk) {
        if (trunk[key].pass) safeSubv[key] = trunk[key].value
        // attempt to use default value only if the property is required
        else if (~required.indexOf(key)) {
          if (trunk[key].hint !== undefined)
            safeSubv[key] = trunk[key].hint
          else return ret;
        }
      }

      // Must after the combination
      const propLen = Object.keys(safeSubv).length
      if (sub.minProperties !== undefined && propLen < sub.minProperties) return ret
      if (sub.maxProperties !== undefined && propLen > sub.maxProperties) {
        // It's hard to make a hint since object is not a indexed collection
        return ret
      }

      // Dependencies
      if (sub.dependencies) {
        for (const depKey in sub.dependencies) {
          const dep = sub.dependencies[depKey]
          // Schema dependencies
          if (type(dep) === 'object') {
            const result = parse(dep, safeSubv, paths + '/dependencies/' + depKey + '/')
            if (!result.pass) return ret
          }
          // Property dependencies
          else if (safeSubv[depKey] !== undefined) {
            for (const depTargetKey of dep) {
              if (safeSubv[depTargetKey] === undefined) return ret
            }
          }
        }
      }

      // respect empty object
      if (isEmptyObject(safeSubv) && !isEmptyObject(subv)) safeSubv = undefined
    }
    else if (sType === 'array') {
      // if (ret.hint === undefined) ret.hint = []

      // List validation
      if (sub.contains) {
        if (!subv.find(v => parse(sub.contains, v, paths + '/contains').pass)) return ret
      }
      else if (sub.items) {
        let results = [];
        if (type(sub.items) === 'object') {
          for (const subvi of subv) {
            // simply pass items
            const result = parse(sub.items, subvi, paths + '/items')
            // Only concat the value
            if (result.pass) results.push(result.value)
            // In strict mode, as long as one does not pass, it will fail.
            // else if (strict) return ret
          }

          if (!results.length) return ret
        }

        // Tuple validation
        else if (type(sub.items) === 'array') {
          for (let i = 0; i < sub.items.length; i++) {
            const result = parse(sub.items[i], subv[i], paths + '/items[' + i + ']')
            if (!result.pass) return ret
            results.push(result.value)
          }

          // Note results does not contain additional items, if any

          if (sub.additionalItems !== false) {
            const additionalV = subv.slice(sub.items.length)
            // by default, it’s okay to add additional items to end
            if (sub.additionalItems === undefined) {
              // concat additional value to results
              results = results.concat(additionalV)
            }
            // additionalItems is a schema
            else {
              const result = parse({ type: 'array', items: sub.additionalItems }, additionalV, paths + '/additionalItems')
              if (!result.pass) return ret
              else {
                // concat additional value to results
                results = results.concat(result.value)
              }
            }
          }
          // `additionalItems: false` has the effect of disallowing extra items in the array.
          else {
            if (sub.items.length !== subv.length) return ret
          }
        }

        safeSubv = results
      }

      // below uses `safeSubv` instead of subv

      if (sub.minItems !== undefined && safeSubv.length < sub.minItems) return ret
      if (sub.maxItems !== undefined && safeSubv.length > sub.maxItems) return ret
      if (sub.uniqueItems !== undefined && safeSubv.length !== new Set(safeSubv.map(JSON.stringify)).size) return ret
    }
    else if (sub.oneOf || sub.anyOf || sub.allOf) {
      const word = sub.oneOf ? 'oneOf' : sub.anyOf ? 'anyOf' : 'allOf';
      let n = 0;
      for (let i = 0; i < sub[word].length; i++) {
        const result = parse(sub[word][i], subv, paths + '/' + word + '[' + i + ']')
        if (result.pass) {
          n++;

          // treat oneOf as anyOf, just return the first valid value
          if (word === 'oneOf' || word === 'anyOf') {
            safeSubv = result.value;
            break;
          }
        }
      }

      if (
        !n ||
        (sub.oneOf && n > 1) ||
        (sub.allOf && n !== sub.allOf.length)
      ) return ret
    }

    ret.value = safeSubv;
    if (safeSubv !== undefined) ret.pass = true;
    return ret
  }
}

const identifierMap = {
  '+': 'plus',
  '&': 'and'
};
exports.escapeIdentifier = function (str) {
  if (!str) return '';
  return Object.keys(identifierMap).reduce((sum, i) => sum.replace(new RegExp('\\' + i, 'g'), identifierMap[i]), str);
}

const localeMap = {
  'zh-cn': 'zh-Hans',
  'zh-hk': 'zh-Hant',
  'zh-tw': 'zh-Hant',
  'en': 'en',
  'ja': 'ja',
};
const oldLocaleMap = {
  'zh-Hans': 'zh-cn',
  'zh-Hant': 'zh-hk',
  'en': 'en',
  'ja': 'ja',
};

/**
 * Convert language code to ISO 639-1
 *
 * @param {string | string[]} ids
 * @param {boolean} toOld reverse
 * @returns {string}
 */
exports.localeId = function (ids, toOld) {
  const id = ids ? typeof ids === 'string' ? ids : ids[0] : '';
  const lowerCasedId = id ? id.toLowerCase() : '';

  if (toOld)
    return localeMap[lowerCasedId] !== undefined ? id : oldLocaleMap[id] || oldLocaleMap.en;

  return oldLocaleMap[id] !== undefined ? id : localeMap[lowerCasedId] || localeMap.en;
}

/**
 * Transform with babel, and minify with uglify
 *
 * @param {string} code
 * @returns {string}
 */
exports.parseJs = jsParser();

/**
 * Minify HTML and CSS with html-minifier
 *
 * @param {string} code
 * @returns {string}
 */
exports.minifyHtml = htmlMinifier();

function jsParser() {
  let babel, uglify;
  try {
    uglify = require('uglify-js');
    babel = require('babel-core');
    require('babel-preset-env');
  } catch (e) { return i => i || '' }

  const esSafe = code => babel.transform(code, { presets: [['env', { 'modules': false }]] });
  const minify = uglify.minify;

  return function (code) {
    if (!code || typeof code !== 'string') return '';

    code = esSafe(code);
    if (code) code = code.code;
    else return '';

    code = minify(code);
    if (code) code = code.code;
    else return '';

    return code;
  }
}

function htmlMinifier() {
  let htmlMinifier;
  try {
    htmlMinifier = require('html-minifier').minify;
  } catch (e) { return i => i || '' }

  const options = {
    minifyCSS: true,
    collapseWhitespace: true,
    removeEmptyAttributes: true,
    removeComments: true
  };

  return function (code) {
    if (!code || typeof code !== 'string') return '';

    return htmlMinifier(code, options);
  }
}

/**
 * Wrap minified code with template
 *
 * Example:
 *
 * snippet('') => ''
 *
 * snippet('code')
 *   => `<div class="is-snippet"><script>code which parsed by parseJs()</script></div>`
 *
 * snippet('', '<script id="mycode">code</script>')
 *   => `<div class="is-snippet"><script id="mycode">code</script></div>`
 *
 * snippet('code', code => `<script id="mycode">${code}</script>`)
 *   => `<div class="is-snippet"><script id="mycode">code which parsed by parseJs()</script></div>`
 *
 * @param {string} code
 * @param {(string | ((code: string) => string))} template
 * @returns {string}
 */
exports.snippet = function (code, template = code => `<script>${code}</script>`) {
  let content = '';

  // ignore code if template is string
  if (typeof template === 'string') {
    content = template;
  }

  // template is function which relay on code
  else if (code) {
    content = template(exports.parseJs(`(function(){${code}})();`));
  }

  return content ? `<div class="is-snippet">${content}</div>` : '';
}

/**
 * Make sure not to process unpublished articles
 *
 * @param {Post | Page} p
 * @returns {boolean}
 */
exports.published = function (p) {
  return Boolean(~['post', 'page'].indexOf(p.layout));
}

/**
 * Render tag object to string
 *
 * @param {VTag} vTag
 * @returns {string}
 */
exports.tag = function (vTag) {
  let { tag, code, ...attrs } = vTag;

  if (tag === 'link') {
    if (!attrs.href) return '';
    if (!attrs.rel) attrs.rel = 'stylesheet';
  }
  else if (tag === 'style') {
    if (!code) return '';
  }
  else if (tag === 'script') {
    if (attrs.src) code = '';
    else if (code) {
      if (attrs.type === undefined) {
        code = exports.parseJs(`(function(){${code}})();`);
        if (!code) return '';
      }
    }
    else return '';
  }

  let attrString = '';
  for (let k in attrs) {
    const v = attrs[k]
    if (v === true) attrString += ' ' + k;
    else attrString += ` ${k}="${v}"`;
  }

  if (tag === 'link') return `<link${attrString}>`;

  return exports.minifyHtml(`<${tag + attrString}>${code || ''}</${tag}>`);
}

/**
 * Parse css background, only support hex color
 * #fff url => { color: '#fff', image: url }
 * @param {string} value
 * @return {{color?: string; image?: string}}
 */
exports.parseBackground = function (value) {
  if (!value) return {}
  const color_hex_regex = /^#(?:[0-9a-fA-F]{3}){1,2}$/
  const part = value.split(/\s+/)
  const ret = {}

  // color at start
  if (color_hex_regex.test(part[0]))
    return {
      color: part[0],
      image: part.slice(1).join(' ')
    }

  // color at end
  const lastIndex = part.length - 1
  if (part[lastIndex] && color_hex_regex.test(part[lastIndex]))
    return {
      color: part.pop(),
      image: part.join(' ')
    }

  return {
    image: value
  }
}
