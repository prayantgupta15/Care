List<AppointmentModel> appointmentsList = [];

class AppointmentModel {
  String drname, Date, Time, Add = 'Main Street, 19', Phone = '+91 952115';

  AppointmentModel({this.drname, this.Date, this.Time});
}

bookAppointment(AppointmentModel appointment) {
  appointmentsList.add(appointment);
}
