extends Node3D

@export var ObjectToRotate:RigidBody3D
@export var pConstant:float
@export var dConstant:float
var TargetRotation:Basis = Basis.IDENTITY
var TargetQuaternion:Quaternion = Quaternion(TargetRotation).normalized()
var CurrerntQuaternion:Quaternion = Quaternion(ObjectToRotate.basis).normalized()

func _physics_process(delta: float) -> void:
	#Quaternion rotationError = targetTransform.rotation * Quaternion.Inverse(objectToMove.rotation);
		#rotationError.ToAngleAxis(out float angleDeg, out Vector3 axis);
		#if (angleDeg > 180f) angleDeg -= 360f;
#
		#float angleRad = angleDeg * Mathf.Deg2Rad;
		#axis = axis.normalized;
#
		#Vector3 proportional = axis * (angleRad * angularPConstant);	
#
		#Vector3 derivative = -objectToMove.angularVelocity * angularDConstant;
#
		#Vector3 torque = proportional + derivative;
		#objectToMove.AddTorque(torque, angularForceMode);
	var rotationErr:Quaternion = TargetQuaternion * CurrerntQuaternion.inverse()
	var angleRad:float = rotationErr.get_angle()
	var angleAxis:Vector3 = rotationErr.get_axis().normalized()
	
	var proportional:Vector3 = angleAxis * (angleRad * pConstant)
	var derivative:Vector3 = -ObjectToRotate.angular_velocity * dConstant
	
	var torque:Vector3 = proportional + derivative
	ObjectToRotate.apply_torque(torque * delta)
		
	
	pass
