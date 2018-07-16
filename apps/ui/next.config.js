const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')
const { ANALYZE } = process.env
const withCSS = require('@zeit/next-css')

module.exports = withCSS({
  webpack(config) {
    if (ANALYZE) {
      config.plugins.push(new BundleAnalyzerPlugin({
        analyzerMode: 'static'
      }))
    }

    return config
  }
})
