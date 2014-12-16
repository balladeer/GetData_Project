### Feature Name Format
Except for the first two columns, all columns are **feature columns**: they contain some data pertaining to the information recorded by the phones during the original HAR data set creation.

Each feature column name is comprised of six parts, seperated by periods ('.').  The format is `summary.domain.data_source.measurment_type.axis.original_estimate`.  Below is a description of each field in the name, as well as the possible values for each:

1. Summary: statistic applied to the original data set to create this tidy dataset
	- always `mean` in this set - all entries are averages of data from the original data set
2. Domain: which domain the data comes from
	- `time` or `frequency`
3. Source of data: 
	- `body`: body-component of the signal from the accelerometer
	- `gravity`: gravity-component of the signal from the accelerometer
	- `gyro`: signal from the gyroscope
4. Measurment type:
	- `linear_acceleration` (in m/s^2)
	- `angular_velocity` (in radians / second)
	- `jerk` (in m/s^3 for body and gravity data, and radians/s^3 for gyroscope data)
5. Axis of operation: which axis the measurement or estimation was taken on
	- `x, y, z`: one of the three directional axes
	- `magnitude`: the magnitude of the 3d-vector
6. Original estimation: the estimated value calculated in the original data set
	- either `mean` or `std`

### List of all columns

The first two columns are:

* activity_name - which of the six activities the record corresponds to
* subject_id - which of the 30 subjects the record belongs to

List of feature names:

* mean.time.body.linear_acceleration.x.mean
* mean.time.body.linear_acceleration.y.mean
* mean.time.body.linear_acceleration.z.mean
* mean.time.body.linear_acceleration.x.std
* mean.time.body.linear_acceleration.y.std
* mean.time.body.linear_acceleration.z.std
* mean.time.gravity.linear_acceleration.x.mean
* mean.time.gravity.linear_acceleration.y.mean
* mean.time.gravity.linear_acceleration.z.mean
* mean.time.gravity.linear_acceleration.x.std
* mean.time.gravity.linear_acceleration.y.std
* mean.time.gravity.linear_acceleration.z.std
* mean.time.body.jerk.x.mean
* mean.time.body.jerk.y.mean
* mean.time.body.jerk.z.mean
* mean.time.body.jerk.x.std
* mean.time.body.jerk.y.std
* mean.time.body.jerk.z.std
* mean.time.gyro.angular_velocity.x.mean
* mean.time.gyro.angular_velocity.y.mean
* mean.time.gyro.angular_velocity.z.mean
* mean.time.gyro.angular_velocity.x.std
* mean.time.gyro.angular_velocity.y.std
* mean.time.gyro.angular_velocity.z.std
* mean.time.gyro.jerk.x.mean
* mean.time.gyro.jerk.y.mean
* mean.time.gyro.jerk.z.mean
* mean.time.gyro.jerk.x.std
* mean.time.gyro.jerk.y.std
* mean.time.gyro.jerk.z.std
* mean.time.body.linear_acceleration.magnitude.mean
* mean.time.body.linear_acceleration.magnitude.std
* mean.time.gravity.linear_acceleration.magnitude.mean
* mean.time.gravity.linear_acceleration.magnitude.std
* mean.time.body.jerk.magnitude.mean
* mean.time.body.jerk.magnitude.std
* mean.time.gyro.angular_velocity.magnitude.mean
* mean.time.gyro.angular_velocity.magnitude.std
* mean.time.gyro.jerk.magnitude.mean
* mean.time.gyro.jerk.magnitude.std
* mean.frequency.body.linear_acceleration.x.mean
* mean.frequency.body.linear_acceleration.y.mean
* mean.frequency.body.linear_acceleration.z.mean
* mean.frequency.body.linear_acceleration.x.std
* mean.frequency.body.linear_acceleration.y.std
* mean.frequency.body.linear_acceleration.z.std
* mean.frequency.body.jerk.x.mean
* mean.frequency.body.jerk.y.mean
* mean.frequency.body.jerk.z.mean
* mean.frequency.body.jerk.x.std
* mean.frequency.body.jerk.y.std
* mean.frequency.body.jerk.z.std
* mean.frequency.gyro.angular_velocity.x.mean
* mean.frequency.gyro.angular_velocity.y.mean
* mean.frequency.gyro.angular_velocity.z.mean
* mean.frequency.gyro.angular_velocity.x.std
* mean.frequency.gyro.angular_velocity.y.std
* mean.frequency.gyro.angular_velocity.z.std
* mean.frequency.body.linear_acceleration.magnitude.mean
* mean.frequency.body.linear_acceleration.magnitude.std
* mean.frequency.body.jerk.magnitude.mean
* mean.frequency.body.jerk.magnitude.std
* mean.frequency.gyro.angular_velocity.magnitude.mean
* mean.frequency.gyro.angular_velocity.magnitude.std
* mean.frequency.gyro.jerk.magnitude.mean
* mean.frequency.gyro.jerk.magnitude.std
