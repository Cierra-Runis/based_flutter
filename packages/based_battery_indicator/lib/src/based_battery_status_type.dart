/// [BasedBatteryStatusType]
enum BasedBatteryStatusType {
  error,
  low,
  charging,
  normal;

  bool get isError => this == BasedBatteryStatusType.error;
  bool get isLow => this == BasedBatteryStatusType.low;
  bool get isCharing => this == BasedBatteryStatusType.charging;
  bool get isNormal => this == BasedBatteryStatusType.normal;
}
