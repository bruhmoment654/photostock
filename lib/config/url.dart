// TODO(init-project): Add server urls.

/// Server url.
enum Url {
  /// Dev url.
  dev('https://api.unsplash.com/'),

  /// Prod url.
  prod('https://api.unsplash.com/');

  /// Url value.
  final String value;

  const Url(this.value);
}
