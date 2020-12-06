class Pain {
  final String location;
  final int scale;
  final String time;

  const Pain(this.location, this.scale, this.time);

  @override
  String toString() {
    return location;
  }
}

const pain = <Pain>[
  Pain('Lower Back', 5, '8:30'),
];
