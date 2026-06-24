%dw 2.0 
import * from dw::core::Strings 
import * from dw::util::Values
type TracePoint = "REQUEST_RECEIVED" | "RESPONSE_RETURNED" | "FLOW_ENTRY" | "FLOW_COMPLETE" | "PROCESS_INFO" | "BEFORE_OUTBOUND" | "AFTER_OUTBOUND" | "BEFORE_TRANSFORM_MESSAGE" | "AFTER_TRANSFORM_MESSAGE" | "ERROR"  
fun log(env: String, priority: String, tracePoint: TracePoint,process: String, sourceSystem: String, targetSystem: String, flowName: String, correlationId: String, api: String) = 
{ 
	"priority": priority, 
	"timeStamp": now(), 
	"correlationId": correlationId, 
	"environment": env, 
	"api" : api,
	"process": process, 
	"sourceSystem" : sourceSystem,
	"targetSystem" : targetSystem,
	"flowName" : flowName,
	"tracePoint": tracePoint   
} 

fun log(env: String, priority: String, tracePoint: TracePoint,process: String, sourceSystem: String, targetSystem: String, flowName: String, correlationId: String, api: String, content: Any | Null) = 
{ 
	"priority": priority, 
	"timeStamp": now(), 
	"correlationId": correlationId, 
	"environment": env, 
	"api" : api,
	"process": process, 
	"sourceSystem" : sourceSystem,
	"targetSystem" : targetSystem,
	"flowName" : flowName,
	"tracePoint": tracePoint, 
	"content": content 
}