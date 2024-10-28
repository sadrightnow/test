

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/) // Keep this as is
application.load(definitionsFromContext(context))
