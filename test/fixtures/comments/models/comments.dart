import 'dart:convert';

import 'package:jsonplaceholder_comments_images/domain/comments/entity/comment.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';

import '../../fixture_reader.dart';

Map<String, dynamic> get commentJsonMocked =>
    jsonDecode(fixture('comments/comment.json'));

const commentsResponseMocked = [
  GetCommentsResponse(
    id: 1,
    postId: 1,
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  GetCommentsResponse(
    id: 2,
    postId: 2,
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  GetCommentsResponse(
    id: 3,
    postId: 3,
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
];

const commentsMocked = [
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
];

const commentsPaginationMocked = [
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
  Comment(
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body:
        "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo neces sitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
  ),
];
