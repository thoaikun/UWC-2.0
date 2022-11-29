const validateEmail = (mail) => {
    let emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/

    if (mail.match(emailRegex))
        return true
    return false
}

const workerValidation = (req, res, next) => {
    if (req.body.email != undefined) {
        if (req.body.email === '')
            res.json({
                result: 'fail',
                message: 'email must not empty'
            })
        else if (!validateEmail(req.body.email))
            res.json({
                result: 'fail',
                message: 'wrong email format'
            })
    }
    if (req.body.name != undefined) {
        if (req.body.name === '')
            res.json({
                result: 'fail',
                message: 'name must not empty'
            })
    }
    if (req.body.phone != undefined) {
        if (req.body.phone === '')
            res.json({
                result: 'fail',
                message: 'phone must not empty'
            })
    }
    if (req.body.role != undefined) {
        if (req.body.role === '')
            res.json({
                result: 'fail',
                message: 'role must not empty'
            })
        else if (req.body.role !== 'collector' && req.body.role !== 'janitor')
            res.json({
                result: 'fail',
                message: 'role can only be collector or janitor'
            })
    }
    next()
}

module.exports = workerValidation