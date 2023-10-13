import { Injectable } from '@nestjs/common';

interface Job {
    job: (any) => void,
    status: boolean,    
    params?: any
}

let list : Job[] = []
 
@Injectable()
export class QueueService {
    constructor() {
      let interval = 1000;      
      setInterval(() => {        
        for (let i = 0; i < list.length; i++) {
            if (list[i].status == false) {
                list[i].status = true;
                list[i].job(list[i].params);
            }
        }                

      }, 200);
      setInterval(() => {
        let new_list : Job[] = []
        for (let i = 0; i < list.length; i++) {
            if (list[i].status == false) {
                new_list.push(list[i])
            }
        }                
        list = new_list;
      }, 10000);
      console.log("Queue service started")
    }
    
    async add_job(job: (any) => void, params?: any) {
        list.push({job: job, status: false, params: params})
    }
    
    async process() {
        
    }
}
