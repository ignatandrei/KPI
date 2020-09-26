import { dboAssVA } from './dboAssVA';
import { dboClients } from './dboClients';
import { dboCounty } from './dboCounty';
import { dboKPI11 } from './dboKPI11';

export class KPI11Data {
    public ass: dboAssVA[];
    public data: dboKPI11[];
    public clients: dboClients[];
    public counties: dboCounty[];
}
