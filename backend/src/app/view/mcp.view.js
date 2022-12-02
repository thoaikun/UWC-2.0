class McpView{
    getAll(res, mcps) {
        if (mcps) {
            res.status(200).json({
                result: 'success',
                message: 'get all mcp',
                size: mcps.length,
                mcps: mcps
            })
        }
        else {
            res.status(400).json({
                result: 'fail',
                message: 'something wrong happened, please try again'
            })
        }
    }

    get(res, status, mcp){
        if(mcp){
            res.status(status).json({
                result:'success',
                message: 'get mcp by id',
                mcp: mcp
            })
        }
        else{
            res.status(status).json({
                result: 'fail',
                message: 'id not exist, please check again',
            })
        }
    }

    updateStatus(res, code){
        if(code === 200){
            res.status(200).json({
                result: 'success',
                message: 'status has been updated',
            })
        }
        else if (code === 400){
            res.status(400).json({
                result:'fail',
                message:'something wrong happened, please try again',
            })
        }
        else if (code === 404){
            res.status(404).json({
                result: 'fail',
                message: 'id not exist, please check again',
            })
            
        }
        else if (code === 405){
            res.status(405).json({
                result:'fail',
                message:'invalid status',
            })
        }
    }

    updateCapacity(res, code){
        if(code === 200){
            res.status(200).json({
                result:'success',
                message: 'current capacity has been updated',
            })
        }
        else if (code === 400){
            res.status(400).json({
                result: 'fail',
                message: 'something wrong happened, please try again',
            })
        }
        else if (code === 404){
            res.status(404).json({
                result:'fail',
                message:'id not exist, please check again',
            })
            
        }
        else if (code === 405){
            res.status(405).json({
                result: 'fail',
                message: 'invalid capacity',
            })
        }
    }
}

module.exports = McpView