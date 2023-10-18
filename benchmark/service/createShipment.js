'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');

/**
 * Workload module for creating medicine records in the supply chain tracking system.
 */
class CreateShipmentWorkload extends WorkloadModuleBase {
    /**
     * Initializes the workload module instance.
     */
    constructor() {
        super();
        this.txIndex = 0;
    }

    /**
     * Assemble transactions for the workload round.
     * @return {Promise<TxStatus[]>}
     */
    async submitTransaction() {
        this.txIndex++;
        const buyerCRN = 'MAN001'; 
        const drugName = 'Paracetamol'; 
        const listOfAssets = ['001','002']
        const transporterCRN = 'TRA01';

        let args = {
            contractId: 'medtracnet',
            contractVersion: '1.1', 
            contractFunction: 'createShipment',
            contractArguments: [buyerCRN, drugName, listOfAssets, transporterCRN],
            timeout: 300 // Set the timeout value as needed.
        };

        await this.sutAdapter.sendRequests(args);
    }
}

/**
 * Create a new instance of the workload module.
 * @return {WorkloadModuleInterface}
 */
function createWorkloadModule() {
    return new CreateShipmentWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
