// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashback_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCashbackHistoryCollection on Isar {
  IsarCollection<CashbackHistory> get cashbackHistorys => this.collection();
}

const CashbackHistorySchema = CollectionSchema(
  name: r'CashbackHistory',
  id: 3875090502673770265,
  properties: {
    r'amountEarned': PropertySchema(
      id: 0,
      name: r'amountEarned',
      type: IsarType.double,
    ),
    r'bookingDetails': PropertySchema(
      id: 1,
      name: r'bookingDetails',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 3,
      name: r'transactionDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cashbackHistoryEstimateSize,
  serialize: _cashbackHistorySerialize,
  deserialize: _cashbackHistoryDeserialize,
  deserializeProp: _cashbackHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionDate': IndexSchema(
      id: 3386085016894654755,
      name: r'transactionDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'transactionDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cashbackHistoryGetId,
  getLinks: _cashbackHistoryGetLinks,
  attach: _cashbackHistoryAttach,
  version: '3.1.0+1',
);

int _cashbackHistoryEstimateSize(
  CashbackHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingDetails.length * 3;
  bytesCount += 3 + object.description.length * 3;
  return bytesCount;
}

void _cashbackHistorySerialize(
  CashbackHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountEarned);
  writer.writeString(offsets[1], object.bookingDetails);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.transactionDate);
}

CashbackHistory _cashbackHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CashbackHistory(
    amountEarned: reader.readDouble(offsets[0]),
    bookingDetails: reader.readString(offsets[1]),
    description: reader.readString(offsets[2]),
    transactionDate: reader.readDateTime(offsets[3]),
  );
  object.id = id;
  return object;
}

P _cashbackHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cashbackHistoryGetId(CashbackHistory object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cashbackHistoryGetLinks(CashbackHistory object) {
  return [];
}

void _cashbackHistoryAttach(
    IsarCollection<dynamic> col, Id id, CashbackHistory object) {
  object.id = id;
}

extension CashbackHistoryQueryWhereSort
    on QueryBuilder<CashbackHistory, CashbackHistory, QWhere> {
  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhere>
      anyTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'transactionDate'),
      );
    });
  }
}

extension CashbackHistoryQueryWhere
    on QueryBuilder<CashbackHistory, CashbackHistory, QWhereClause> {
  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      transactionDateEqualTo(DateTime transactionDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionDate',
        value: [transactionDate],
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      transactionDateNotEqualTo(DateTime transactionDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionDate',
              lower: [],
              upper: [transactionDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionDate',
              lower: [transactionDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionDate',
              lower: [transactionDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionDate',
              lower: [],
              upper: [transactionDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      transactionDateGreaterThan(
    DateTime transactionDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionDate',
        lower: [transactionDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      transactionDateLessThan(
    DateTime transactionDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionDate',
        lower: [],
        upper: [transactionDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterWhereClause>
      transactionDateBetween(
    DateTime lowerTransactionDate,
    DateTime upperTransactionDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'transactionDate',
        lower: [lowerTransactionDate],
        includeLower: includeLower,
        upper: [upperTransactionDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CashbackHistoryQueryFilter
    on QueryBuilder<CashbackHistory, CashbackHistory, QFilterCondition> {
  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      amountEarnedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountEarned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      amountEarnedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountEarned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      amountEarnedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountEarned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      amountEarnedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountEarned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      bookingDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      transactionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      transactionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      transactionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterFilterCondition>
      transactionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CashbackHistoryQueryObject
    on QueryBuilder<CashbackHistory, CashbackHistory, QFilterCondition> {}

extension CashbackHistoryQueryLinks
    on QueryBuilder<CashbackHistory, CashbackHistory, QFilterCondition> {}

extension CashbackHistoryQuerySortBy
    on QueryBuilder<CashbackHistory, CashbackHistory, QSortBy> {
  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByAmountEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarned', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByAmountEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarned', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByBookingDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDetails', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByBookingDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDetails', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }
}

extension CashbackHistoryQuerySortThenBy
    on QueryBuilder<CashbackHistory, CashbackHistory, QSortThenBy> {
  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByAmountEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarned', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByAmountEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarned', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByBookingDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDetails', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByBookingDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingDetails', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }
}

extension CashbackHistoryQueryWhereDistinct
    on QueryBuilder<CashbackHistory, CashbackHistory, QDistinct> {
  QueryBuilder<CashbackHistory, CashbackHistory, QDistinct>
      distinctByAmountEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountEarned');
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QDistinct>
      distinctByBookingDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CashbackHistory, CashbackHistory, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }
}

extension CashbackHistoryQueryProperty
    on QueryBuilder<CashbackHistory, CashbackHistory, QQueryProperty> {
  QueryBuilder<CashbackHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CashbackHistory, double, QQueryOperations>
      amountEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountEarned');
    });
  }

  QueryBuilder<CashbackHistory, String, QQueryOperations>
      bookingDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingDetails');
    });
  }

  QueryBuilder<CashbackHistory, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CashbackHistory, DateTime, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }
}
