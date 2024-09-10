const cds = require('@sap/cds');

module.exports = function (){
    
    this.on('completeProject', async(req) => {

        const {Projects, Tasks} = cds.entities('interview');

        const ID = req.data.projectId;

        if(!ID) req.reject('ID ca not be empty')

        const aProject  = await SELECT.from(Projects).where({ID: ID});   

        if(aProject.length > 0 && aProject[0].status === 'Completed') req.reject('Proecjt already closed.')

        await UPDATE(Tasks).set({completed: true}).where({project_ID: ID}),   
        
        await UPDATE(Projects).set({status: 'Completed'}).where({ID: ID})

        return aProject[0];

    })


}