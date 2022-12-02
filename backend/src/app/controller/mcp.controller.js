const McpModel = require('../model/mcp.model')
const McpView = require('../view/mcp.view')

const mcpModel = new McpModel()
const mcpView = new McpView()

class McpController{
    getAll(req, res){
        mcpModel.getAll(
            (mcps) => {mcpView.getAll(res, mcps)}
        )
    }

    get(req, res){
        let id = Number.parseInt(req.params.id)
        mcpModel.get(id,
            (status, mcp) => {mcpView.get(res, status, mcp)}
        )
    }

    updateStatus(req, res){
        let id = Number.parseInt(req.params.id)
        let status = req.body.status
        mcpModel.updateStatus(id, status,
            (code) => {mcpView.updateStatus(res, code)}
        )
    }

    updateCapacity(req, res){
        let id = Number.parseInt(req.params.id)
        let capacity = Number.parseFloat(req.body.capacity)
        mcpModel.updateCapacity(id, capacity,
            (code) => {mcpView.updateCapacity(res, code)}
        )
    }
}

module.exports = new McpController