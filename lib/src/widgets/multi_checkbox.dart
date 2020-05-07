import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef SelectedCallback<T> = void Function(T entity, bool selected);
typedef EntityName<T> = String Function(T entity);
typedef EntityImageUrl<T> = String Function(T entity);

class StatelessMultiCheckbox<T> extends StatelessWidget {
  final List<T> entities;
  final List<T> selectedEntities;
  final SelectedCallback<T> onChanged;
  final EntityName<T> entityName;
  final EntityImageUrl<T> entityImageUrl;

  StatelessMultiCheckbox({
    @required this.entities,
    @required this.selectedEntities,
    @required this.onChanged,
    this.entityName = defaultEntityName,
    this.entityImageUrl = defaultEntityImageUrl,
    Key key,
  })  : assert(entities != null),
        assert(selectedEntities != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entities.length,
      itemBuilder: (context, index) =>
          _buildEntityListItem(context, entities[index]),
    );
  }

  _buildEntityListItem(BuildContext context, T entity) {
    return ListTile(
      leading: Checkbox(
        value: selectedEntities.contains(entity),
        onChanged: (selected) => onChanged(entity, selected),
      ),
      title: Text(entityName(entity)),
      trailing: _entityImage(entityImageUrl(entity)),
    );
  }

  Widget _entityImage(String url) {
    double height = 30;
    double width = 30;

    Widget placeHolder = Container(
      width: width,
      height: height,
    );

    if (url == null) {
      return placeHolder;
    }

    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) => placeHolder,
      errorWidget: (context, url, widget) => placeHolder,
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scrollbar(
//      child: GridView.count(
//        padding: EdgeInsets.symmetric(horizontal: 8.0),
//        shrinkWrap: true,
//        crossAxisCount: 2,
//        childAspectRatio: 2.5,
//        scrollDirection: Axis.vertical,
//        children: entities
//            .map<GridTile>((entity) => _checkboxGridTile(context, entity))
//            .toList(),
//      ),
//    );
//  }

//  Widget _checkboxGridTile(BuildContext context, T entity) {
//    return GridTile(
//      child: Row(
//        children: <Widget>[
//          Checkbox(
//            value: selectedEntities.contains(entity),
//            onChanged: (selected) => onChanged(entity, selected),
//          ),
//          // TODO using expanded here will make long text disappear.. fix this
//          Flexible(child: Text(entityName(entity))),
//        ],
//      ),
//    );
//  }

  static String defaultEntityName(Object entity) {
    return entity.toString();
  }

  static String defaultEntityImageUrl(Object entity) {
    return null;
  }
}
