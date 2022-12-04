const spec = {
    swagger: '2.0',
    info: {
        description: "Project information and API documentation",
        version: '1.0.0',
        title: 'UWC 2.0'
    },
    host: 'https://uwc-backend.onrender.com',
    basePath: '',
    tags: [
        {
            name: 'Authentication',
            description: 'Login, logout and user authentication'
        },
        {
            name: 'Worker',
            description: 'Worker\'s information, update, delete, ... '
        },
        {
            name: 'Vehicle',
            description: 'Vehicle\'s information, update, delete,...'
        },
        {
            name: 'MCPs',
            description: 'MCPs\'s information, update capacity, ...'
        },
        {
            name: 'Route',
            description: 'Create, assign MCP, vehicle and more'
        },
        {
            name: 'Task',
            description: 'Task\'s information, create, update, ...'
        }
    ],
    schemes: ['https'],
    paths: {
        '/auth/login': {
            post: {
                tags: ['Authentication'],
                summary: 'Login in to system',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'body',
                        name: 'email',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                email: {
                                    type: 'string'
                                },
                                password: {
                                    type: 'string'
                                }
                            }
                        },
                    },
                ],
                responses: {
                    200: {
                        description: 'Login success',
                        schema: {
                            properties: {
                                result: {
                                    type: 'string',
                                },
                                message: {
                                    type: 'string'
                                },
                                accessToken: {
                                    type: 'string',
                                    description: 'token use to access data on server'
                                },
                                refreshToken: {
                                    type: 'string',
                                    description: 'token use to refresh access token when it expires'
                                }
                            }
                        }
                    },
                    401: {
                        description: 'Email or password is not correct',
                        schema: {
                            properties: {
                                result: {
                                    type: 'string'
                                },
                                message: {
                                    type: 'string'
                                }
                            }
                        }
                    }
                }
            }
        },
        '/auth/logout': {
            patch: {
                tags: ['Authentication'],
                summary: 'Exit the system',
                produces: ['application/json'],
                parameters: [
                    {
                        'in': 'body',
                        name: 'refreshToken',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                refreshToken: {
                                    type: 'string'
                                }
                            }
                        }
                    }
                ],
                responses: {
                    200: {
                        description: 'Logout success',
                        schema: {
                            properties: {
                                result: {
                                    type: 'string',
                                },
                                message: {
                                    type: 'string'
                                }
                            }
                        }
                    }
                }
            }
        },
        '/auth/renew': {
            post: {
                tags: ['Authentication'],
                summary: 'Renew access token',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'body',
                        name: 'refreshToken',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                refreshToken: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'Refresh token create when login'
                    }
                ],
                responses: {
                    200: {
                        description: 'Renew success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        newAccessToken: {
                                            type: 'string',
                                            description: 'New access will be used'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'Refresh token is not correct',
                        schema: {
                            properties: {
                                result: {
                                    type: 'string'
                                },
                                message: {
                                    type: 'string'
                                }
                            }
                        }
                    }
                }
            }
        },

        '/worker': {
            get: {
                tags: ['Worker'],
                summary: 'Get all worker in the system',
                produces: ['application/json'],
                responses: {
                    200: {
                        description: 'Get all worker success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        workers: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/worker'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        'worker/create': {
            post: {
                tags: ['Worker'],
                summary: 'Create a new worker',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'body',
                        name: 'body',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                email: {
                                    type: 'string'
                                },
                                phone: {
                                    type: 'string'
                                },
                                name: {
                                    type: 'string'
                                },
                                role: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'worker\'s info, role must be collector | janitor'
                    }
                ],
                responses: {
                    200: {
                        description: 'Create worker success',
                        schema: {
                            allOf: [
                                { $ref: '#/definitions/message' },
                                {
                                    properties: {
                                        password: {
                                            type: 'string',
                                            description: 'Auto generate password'
                                        }
                                    }
                                }
                            ]

                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/worker/{id}': {
            get: {
                tags: ['Worker'],
                summary: 'Get worker in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'worker\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get worker success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        worker: {
                                            $ref: '#/definitions/worker'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
            patch: {
                tags: ['Worker'],
                summary: 'Update worker in the system by id',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'worker\'s id'
                    },
                    {
                        in: 'body',
                        name: 'body',
                        required: false,
                        schema: {
                            type: 'object',
                            properties: {
                                email: {
                                    type: 'string'
                                },
                                phone: {
                                    type: 'string'
                                },
                                name: {
                                    type: 'string'
                                },
                                role: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'Update info option, all are option, role must be collector | janitor'
                    }
                ],
                responses: {
                    200: {
                        description: 'update worker success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
            delete: {
                tags: ['Worker'],
                summary: 'Delete worker in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'worker\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'delete worker success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/worker/changePassword/{id}': {
            patch: {
                tags: ['Worker'],
                summary: 'Change worker password',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'worker\'s id'
                    },
                    {
                        in: 'body',
                        name: 'body',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                oldPassword: {
                                    type: 'string'
                                },
                                newPassword: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'worker\'s current password and new password'
                    }
                ],
                responses: {
                    200: {
                        description: 'Change password success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },

        '/vehicle': {
            get: {
                tags: ['Vehicle'],
                summary: 'Get all vehicle in the system',
                produces: ['application/json'],
                responses: {
                    200: {
                        description: 'Get all vehicle success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        vehicles: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/vehicle'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        '/vehicle/create': {
            post: {
                tags: ['Vehicle'],
                summary: 'Create a new vehicle',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'body',
                        name: 'body',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                vehicleNumber: {
                                    type: 'string'
                                },
                                type: {
                                    type: 'string'
                                },
                                status: {
                                    type: 'string'
                                },
                                weight: {
                                    type: 'number'
                                },
                                fuelConsumption: {
                                    type: 'number'
                                }
                            }
                        },
                        description: 'vehicle\'s info\n Vehicle status must be GOOD | BROKEN\n Vehicle type must be TRUCK | TROLLER'
                    }
                ],
                responses: {
                    200: {
                        description: 'Create worker success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/vehicle/{id}': {
            get: {
                tags: ['Vehicle'],
                summary: 'Get vehicle in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'vehicle\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get vehicle success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        vehicle: {
                                            $ref: '#/definitions/vehicle'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
            patch: {
                tags: ['Vehicle'],
                summary: 'Update vehicle in the system by id',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'worker\'s id'
                    },
                    {
                        in: 'body',
                        name: 'body',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                vehicleNumber: {
                                    type: 'string'
                                },
                                type: {
                                    type: 'string'
                                },
                                status: {
                                    type: 'string'
                                },
                                weight: {
                                    type: 'number'
                                },
                                fuelConsumption: {
                                    type: 'number'
                                },
                                managedBy: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'vehicle\'s info\n All are option\n Vehicle status must be GOOD | BROKEN\n Vehicle type must be TRUCK | TROLLER'
                    }
                ],
                responses: {
                    200: {
                        description: 'update vehicle success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
            delete: {
                tags: ['Vehicle'],
                summary: 'Delete vehicle in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'vehicle\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'delete vehicle success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },

        '/mcp': {
            get: {
                tags: ['MCPs'],
                summary: 'Get all MCPs in the system',
                produces: ['application/json'],
                responses: {
                    200: {
                        description: 'Get all vehicle success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        mcps: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/mcp'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        '/mcp/{id}': {
            get: {
                tags: ['MCPs'],
                summary: 'Get mcp in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'mcp\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get mcp success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        mcp: {
                                            $ref: '#/definitions/vehicle'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        '/mcp/updateStatus/{id}': {
            patch: {
                tags: ['MCPs'],
                summary: 'Update MCP status',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'mcp\'s id'
                    },
                    {
                        in: 'body',
                        name: 'status',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                status: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'mcp\'s status'
                    },
                ],
                responses: {
                    200: {
                        description: 'update status success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        '/mcp/updateCapacity/{id}': {
            patch: {
                tags: ['MCPs'],
                summary: 'Update MCP capacity',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'mcp\'s id'
                    },
                    {
                        in: 'body',
                        name: 'capacity',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                capacity: {
                                    type: 'string'
                                }
                            }
                        },
                        description: 'mcp\'s capacity'
                    },
                ],
                responses: {
                    200: {
                        description: 'update capacity success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },

        '/route': {
            get: {
                tags: ['Route'],
                summary: 'Get all routes in the system',
                produces: ['application/json'],
                responses: {
                    200: {
                        description: 'Get all routes success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        routes: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/route'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'Route is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        // '/route/create': {
        //     post: {
        //         tags: ['Route'],
        //         summary: 'Create a new route',
        //         consumes: ['application/json'],
        //         produces: ['application/json'],
        //         parameters: [
        //             {
        //                 in: 'formData',
        //                 name: 'vehicleNumber',
        //                 required: true,
        //                 schema: {
        //                     type: 'string'
        //                 },
        //                 description: 'vehicle\'s number'
        //             },
        //             {
        //                 in: 'body',
        //                 name: 'paths',
        //                 required: true,
        //                 schema: {
        //                     type: 'array',
        //                     items: { $ref: '#/definitions/path' }
        //                 },
        //                 description: 'route\'s path'
        //             },
        //             {
        //                 in: 'body',
        //                 name: 'MCPs',
        //                 required: true,
        //                 schema: {
        //                     type: 'array',
        //                     items: {
        //                         type: 'number'
        //                     }
        //                 },
        //                 description: 'mcps\'s id'
        //             }
        //         ],
        //         responses: {
        //             200: {
        //                 description: 'Create worker success',
        //                 schema: {
        //                     $ref: '#/definitions/message'
        //                 }
        //             },
        //             401: {
        //                 description: 'User is unauthorized',
        //                 schema: {
        //                     $ref: '#/definitions/message'
        //                 }
        //             },
        //             405: {
        //                 description: 'Invalid input',
        //                 schema: {
        //                     $ref: '#/definitions/message'
        //                 }
        //             }
        //         },
        //         security: [
        //             {"bearerAuth": []}
        //         ]
        //     },
        // },
        '/route/{id}': {
            get: {
                tags: ['Route'],
                summary: 'Get route in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'route\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get vehicle success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        route: {
                                            $ref: '#/definitions/route'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
            delete: {
                tags: ['Route'],
                summary: 'Delete route in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'vehicle\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'delete route success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },

        '/task': {
            get: {
                tags: ['Task'],
                summary: 'Get all task in the system',
                produces: ['application/json'],
                responses: {
                    200: {
                        description: 'Get all task success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        tasks: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/task'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            }
        },
        '/task/create': {
            post: {
                tags: ['Task'],
                summary: 'Create a new task',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'body',
                        name: 'body',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                workingTime: {
                                    type: 'string',
                                    format: 'date'
                                },
                                status: {
                                    type: 'string'
                                },
                                createBy: {
                                    type: 'number'
                                },
                                doneBy: {
                                    type: 'number'
                                },
                                route: {
                                    type: 'number'
                                },

                            }
                        },
                        description: 'task\'s info\n Status must be WAITING | DOING | DONE \n createBy, doneBy, route are id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Create task success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/task/{id}': {
            get: {
                tags: ['Task'],
                summary: 'Get task in the system by id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'task\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get task success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        task: {
                                            $ref: '#/definitions/task'
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/task/user/{userId}': {
            get: {
                tags: ['Task'],
                summary: 'Get task in the system by user id',
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'userId',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'user\'s id'
                    }
                ],
                responses: {
                    200: {
                        description: 'Get task by user success',
                        schema: {
                            allOf: [
                                {$ref: '#/definitions/message'},
                                {
                                    properties: {
                                        size: {
                                            type: 'integer'
                                        },
                                        tasks: {
                                            type: 'array',
                                            items: {$ref: '#/definitions/task'}
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/task/updateAcceptTime/{id}': {
            patch: {
                tags: ['Task'],
                summary: 'Update task accept time in the system by id',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'task\'s id'
                    },
                    {
                        in: 'body',
                        name: 'acceptTime',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                acceptTime: {
                                    type: 'string',
                                    format: 'date',
                                }
                            }
                        },
                        description: 'task\'s accept time'
                    }
                ],
                responses: {
                    200: {
                        description: 'update accept time success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        },
        '/task/updateDoneTime/{id}': {
            patch: {
                tags: ['Task'],
                summary: 'Update task done time in the system by id',
                consumes: ['application/json'],
                produces: ['application/json'],
                parameters: [
                    {
                        in: 'path',
                        name: 'id',
                        required: true,
                        schema: {
                            type: 'integer'
                        },
                        description: 'task\'s id'
                    },
                    {
                        in: 'body',
                        name: 'doneTime',
                        required: true,
                        schema: {
                            type: 'object',
                            properties: {
                                doneTime: {
                                    type: 'string',
                                    format: 'date',
                                }
                            }
                        },
                        description: 'task\'s done time'
                    }
                ],
                responses: {
                    200: {
                        description: 'update done time success',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    401: {
                        description: 'User is unauthorized',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    404: {
                        description: 'Invalid id',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    },
                    405: {
                        description: 'Invalid input',
                        schema: {
                            $ref: '#/definitions/message'
                        }
                    }
                },
                security: [
                    {"bearerAuth": []}
                ]
            },
        }
    },
    securityDefinitions: {
        bearerAuth: {
            name: 'Authorization',
            in: 'header',
            type: 'apiKey',
            description: 'JWT Authorization header'
        }
    },
    definitions: {
        message: {
            type: 'object',
            properties: {
                result: {
                    type: 'string'
                },
                message: {
                    type: 'string'
                }
            }
        },
        worker: {
            type: 'object',
            properties: {
                id: {
                    type: 'integer'
                },
                email: {
                    type: 'string'
                },
                name: {
                    type: 'string'
                },
                phone: {
                    type: 'string'
                },
                fCollector: {
                    type: 'boolean',
                    description: 'True if this worker\'s role is collector'
                },
                fJanitor: {
                    type: 'boolean',
                    description: 'True if this worker\'s role is janitor'
                }
            }
        },
        mcp: {
            type: 'object',
            properties: {
                id: {
                    type: 'integer'
                },
                totalCapacity: {
                    type: 'number'
                },
                status: {
                    type: 'string',
                    enum: ['ONLINE', 'DISCONNECT', 'OFFLINE']
                },
                address: {
                    type: 'string'
                },
                currentCapacity: {
                    type: 'number',
                    description: 'Capacity that has been used'
                }
            }
        },
        vehicle: {
            type: 'object',
            properties: {
                id: {
                    type: 'integer'
                },
                vehicleNumber: {
                    type: 'string'
                },
                type: {
                    type: 'string',
                    enum: ['TRUCK', 'TROLLER']
                },
                status: {
                    type: 'string',
                    enum: ['GOOD', 'BROKEN']
                },
                weight: {
                    type: 'number'
                },
                fuelConsumption: {
                    type: 'number'
                },
                managedBy: {
                    type: 'string'
                }
            }
        },
        path: {
            type: 'object',
            properties: {
                pathId: {
                    type: 'integer'
                },
                name: {
                    type: 'string'
                },
                startPoint: {
                    type: 'string',
                    description: 'Starting point of the path'
                },
                endPoint: {
                    type: 'string',
                    description: 'Ending point of the path'
                },
                distance: {
                    type: 'number',
                    description: 'Path\'s distance'
                }
            }
        },
        briefmcp: {
            type: 'object',
            properties: {
                id: {
                    type: 'number'
                },
                status: {
                    type: 'string'
                },
                address: {
                    type: 'string'
                }
            }
        },
        route: {
            type: 'object',
            properties: {
                id: {
                    type: 'integer'
                },
                vehicleNumber: {
                    type: 'string'
                },
                paths: {
                    type: 'array',
                    items: { $ref: '#/definitions/path' }
                },
                MCPs: {
                    type: 'array',
                    items: { $ref: '#/definitions/briefmcp' }
                }
            }
        },
        task: {
            type: 'object',
            properties: {
                createdTime: {
                    type: 'string',
                    format: 'date',
                    description: 'Time that this task was created'
                },
                workingTime: {
                    type: 'string',
                    format: 'date',
                    description: 'Time that this task is scheduled'
                },
                status: {
                    type: 'string',
                    enum: ['WAITING', 'DOING', 'DONE']
                },
                createBy: {
                    type: 'string',
                    description: 'Name of back officer created this task'
                },
                doBy: {
                    type: 'string',
                    description: 'Name of worker that will do this task'
                },
                acceptTime: {
                    type: 'string',
                    format: 'date'
                },
                doneTime: {
                    type: 'string',
                    format: 'date'
                },
                routeId: {
                    type: 'integer',
                    description: 'Route will go on this task'
                }
            }
        }
    }
}