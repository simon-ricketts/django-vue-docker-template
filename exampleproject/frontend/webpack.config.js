const path = require('path');

const BundleTracker = require('webpack-bundle-tracker');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
    context: __dirname,
    entry: {
        main: './src/main.js'
    },
    output: {
        path: path.resolve(__dirname, 'static/bundles'),
        filename: 'main.js'
    },
    module: {
        rules: [{
                test: /\.vue$/,
                use: 'vue-loader'
            },
            {
                test: /\.s(c|a)ss$/,
                use: [
                    'vue-style-loader',
                    'css-loader',
                    {
                        loader: 'sass-loader',
                        options: {
                            implementation: require('sass'),
                            fiber: require('fibers'),
                        },
                        options: {
                            implementation: require('sass'),
                            sassOptions: {
                                fiber: require('fibers'),
                            },
                        },
                    },
                ],
            },
            {
                test: /\.css$/,
                loader: 'style-loader!css-loader'
            },
        ]
    },
    plugins: [
        new BundleTracker({
            filename: './webpack-stats.json'
        }),
        new VueLoaderPlugin(),
        new CleanWebpackPlugin()
    ],
    resolve: {
        extensions: ['.js', '.vue', '.json'],
        alias: {
            '@': path.resolve('src')
        }
    },
    devServer: {
        contentBase: './static/bundles',
        host: '0.0.0.0',
        writeToDisk: true
    }
};