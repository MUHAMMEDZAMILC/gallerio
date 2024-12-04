// To parse this JSON data, do
//
//     final collection = collectionFromJson(jsonString);

import 'dart:convert';

List<Collection> collectionFromJson(String str) => List<Collection>.from(json.decode(str).map((x) => Collection.fromJson(x)));

String collectionToJson(List<Collection> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Collection {
    String? id;
    String? title;
    String? description;
    DateTime? publishedAt;
    DateTime? lastCollectedAt;
    DateTime? updatedAt;
    bool? featured;
    int? totalPhotos;
    bool? private;
    String? shareKey;
    List<Tag>? tags;
    CollectionLinks? links;
    User? user;
    CollectionCoverPhoto? coverPhoto;
    List<PreviewPhoto>? previewPhotos;

    Collection({
        this.id,
        this.title,
        this.description,
        this.publishedAt,
        this.lastCollectedAt,
        this.updatedAt,
        this.featured,
        this.totalPhotos,
        this.private,
        this.shareKey,
        this.tags,
        this.links,
        this.user,
        this.coverPhoto,
        this.previewPhotos,
    });

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        lastCollectedAt: json["last_collected_at"] == null ? null : DateTime.parse(json["last_collected_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        links: json["links"] == null ? null : CollectionLinks.fromJson(json["links"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        coverPhoto: json["cover_photo"] == null ? null : CollectionCoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: json["preview_photos"] == null ? [] : List<PreviewPhoto>.from(json["preview_photos"]!.map((x) => PreviewPhoto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt?.toIso8601String(),
        "last_collected_at": lastCollectedAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "user": user?.toJson(),
        "cover_photo": coverPhoto?.toJson(),
        "preview_photos": previewPhotos == null ? [] : List<dynamic>.from(previewPhotos!.map((x) => x.toJson())),
    };
}

class CollectionCoverPhoto {
    String? id;
    String? slug;
    AlternativeSlugs? alternativeSlugs;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    String? altDescription;
    List<dynamic>? breadcrumbs;
    Urls? urls;
    CoverPhotoLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic sponsorship;
    PurpleTopicSubmissions? topicSubmissions;
    AssetType? assetType;
    User? user;

    CollectionCoverPhoto({
        this.id,
        this.slug,
        this.alternativeSlugs,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.breadcrumbs,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.assetType,
        this.user,
    });

    factory CollectionCoverPhoto.fromJson(Map<String, dynamic> json) => CollectionCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: json["alternative_slugs"] == null ? null : AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null ? [] : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : CoverPhotoLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null ? null : PurpleTopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "user": user?.toJson(),
    };
}

class AlternativeSlugs {
    String? en;
    String? es;
    String? ja;
    String? fr;
    String? it;
    String? ko;
    String? de;
    String? pt;

    AlternativeSlugs({
        this.en,
        this.es,
        this.ja,
        this.fr,
        this.it,
        this.ko,
        this.de,
        this.pt,
    });

    factory AlternativeSlugs.fromJson(Map<String, dynamic> json) => AlternativeSlugs(
        en: json["en"],
        es: json["es"],
        ja: json["ja"],
        fr: json["fr"],
        it: json["it"],
        ko: json["ko"],
        de: json["de"],
        pt: json["pt"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "es": es,
        "ja": ja,
        "fr": fr,
        "it": it,
        "ko": ko,
        "de": de,
        "pt": pt,
    };
}

enum AssetType {
    PHOTO
}

final assetTypeValues = EnumValues({
    "photo": AssetType.PHOTO
});

class CoverPhotoLinks {
    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    CoverPhotoLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    factory CoverPhotoLinks.fromJson(Map<String, dynamic> json) => CoverPhotoLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class PurpleTopicSubmissions {
    Blue? nature;
    Blue? experimental;
    Blue? blue;
    Blue? texturesPatterns;

    PurpleTopicSubmissions({
        this.nature,
        this.experimental,
        this.blue,
        this.texturesPatterns,
    });

    factory PurpleTopicSubmissions.fromJson(Map<String, dynamic> json) => PurpleTopicSubmissions(
        nature: json["nature"] == null ? null : Blue.fromJson(json["nature"]),
        experimental: json["experimental"] == null ? null : Blue.fromJson(json["experimental"]),
        blue: json["blue"] == null ? null : Blue.fromJson(json["blue"]),
        texturesPatterns: json["textures-patterns"] == null ? null : Blue.fromJson(json["textures-patterns"]),
    );

    Map<String, dynamic> toJson() => {
        "nature": nature?.toJson(),
        "experimental": experimental?.toJson(),
        "blue": blue?.toJson(),
        "textures-patterns": texturesPatterns?.toJson(),
    };
}

class Blue {
    Status? status;
    DateTime? approvedOn;

    Blue({
        this.status,
        this.approvedOn,
    });

    factory Blue.fromJson(Map<String, dynamic> json) => Blue(
        status: statusValues.map[json["status"]]!,
        approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
    };
}

enum Status {
    APPROVED
}

final statusValues = EnumValues({
    "approved": Status.APPROVED
});

class Urls {
    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
        this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class User {
    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    int? totalPromotedPhotos;
    int? totalIllustrations;
    int? totalPromotedIllustrations;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.totalPromotedPhotos,
        this.totalIllustrations,
        this.totalPromotedIllustrations,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
        profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        totalIllustrations: json["total_illustrations"],
        totalPromotedIllustrations: json["total_promoted_illustrations"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "total_illustrations": totalIllustrations,
        "total_promoted_illustrations": totalPromotedIllustrations,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
    };
}

class UserLinks {
    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String? small;
    String? medium;
    String? large;

    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class CollectionLinks {
    String? self;
    String? html;
    String? photos;
    String? related;

    CollectionLinks({
        this.self,
        this.html,
        this.photos,
        this.related,
    });

    factory CollectionLinks.fromJson(Map<String, dynamic> json) => CollectionLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
    };
}

class PreviewPhoto {
    String? id;
    String? slug;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? blurHash;
    AssetType? assetType;
    Urls? urls;

    PreviewPhoto({
        this.id,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.blurHash,
        this.assetType,
        this.urls,
    });

    factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        blurHash: json["blur_hash"],
        assetType: assetTypeValues.map[json["asset_type"]]!,
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "blur_hash": blurHash,
        "asset_type": assetTypeValues.reverse[assetType],
        "urls": urls?.toJson(),
    };
}

class Tag {
    TypeEnum? type;
    String? title;
    Source? source;

    Tag({
        this.type,
        this.title,
        this.source,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: typeEnumValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source?.toJson(),
    };
}

class Source {
    Ancestry? ancestry;
    Title? title;
    Subtitle? subtitle;
    String? description;
    dynamic redirect;
    String? metaTitle;
    String? metaDescription;
    SourceCoverPhoto? coverPhoto;
    dynamic affiliateSearchQuery;

    Source({
        this.ancestry,
        this.title,
        this.subtitle,
        this.description,
        this.redirect,
        this.metaTitle,
        this.metaDescription,
        this.coverPhoto,
        this.affiliateSearchQuery,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: json["ancestry"] == null ? null : Ancestry.fromJson(json["ancestry"]),
        title: titleValues.map[json["title"]]!,
        subtitle: subtitleValues.map[json["subtitle"]]!,
        description: json["description"],
        redirect: json["redirect"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: json["cover_photo"] == null ? null : SourceCoverPhoto.fromJson(json["cover_photo"]),
        affiliateSearchQuery: json["affiliate_search_query"],
    );

    Map<String, dynamic> toJson() => {
        "ancestry": ancestry?.toJson(),
        "title": titleValues.reverse[title],
        "subtitle": subtitleValues.reverse[subtitle],
        "description": description,
        "redirect": redirect,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto?.toJson(),
        "affiliate_search_query": affiliateSearchQuery,
    };
}

class Ancestry {
    TypeClass? type;

    Ancestry({
        this.type,
    });

    factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: json["type"] == null ? null : TypeClass.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
    };
}

class TypeClass {
    TypeSlug? slug;
    PrettySlug? prettySlug;
    dynamic redirect;

    TypeClass({
        this.slug,
        this.prettySlug,
        this.redirect,
    });

    factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        slug: typeSlugValues.map[json["slug"]]!,
        prettySlug: prettySlugValues.map[json["pretty_slug"]]!,
        redirect: json["redirect"],
    );

    Map<String, dynamic> toJson() => {
        "slug": typeSlugValues.reverse[slug],
        "pretty_slug": prettySlugValues.reverse[prettySlug],
        "redirect": redirect,
    };
}

enum PrettySlug {
    BACKGROUNDS,
    HD_WALLPAPERS
}

final prettySlugValues = EnumValues({
    "Backgrounds": PrettySlug.BACKGROUNDS,
    "HD Wallpapers": PrettySlug.HD_WALLPAPERS
});

enum TypeSlug {
    BACKGROUNDS,
    WALLPAPERS
}

final typeSlugValues = EnumValues({
    "backgrounds": TypeSlug.BACKGROUNDS,
    "wallpapers": TypeSlug.WALLPAPERS
});

class SourceCoverPhoto {
    Id? id;
    CoverPhotoSlug? slug;
    AlternativeSlugs? alternativeSlugs;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? promotedAt;
    int? width;
    int? height;
    Color? color;
    BlurHash? blurHash;
    String? description;
    AltDescription? altDescription;
    List<dynamic>? breadcrumbs;
    Urls? urls;
    CoverPhotoLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic sponsorship;
    FluffyTopicSubmissions? topicSubmissions;
    AssetType? assetType;
    bool? premium;
    bool? plus;
    User? user;

    SourceCoverPhoto({
        this.id,
        this.slug,
        this.alternativeSlugs,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.breadcrumbs,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.assetType,
        this.premium,
        this.plus,
        this.user,
    });

    factory SourceCoverPhoto.fromJson(Map<String, dynamic> json) => SourceCoverPhoto(
        id: idValues.map[json["id"]]!,
        slug: coverPhotoSlugValues.map[json["slug"]]!,
        alternativeSlugs: json["alternative_slugs"] == null ? null : AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: colorValues.map[json["color"]]!,
        blurHash: blurHashValues.map[json["blur_hash"]]!,
        description: json["description"],
        altDescription: altDescriptionValues.map[json["alt_description"]]!,
        breadcrumbs: json["breadcrumbs"] == null ? [] : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : CoverPhotoLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null ? null : FluffyTopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        premium: json["premium"],
        plus: json["plus"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "slug": coverPhotoSlugValues.reverse[slug],
        "alternative_slugs": alternativeSlugs?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": colorValues.reverse[color],
        "blur_hash": blurHashValues.reverse[blurHash],
        "description": description,
        "alt_description": altDescriptionValues.reverse[altDescription],
        "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "premium": premium,
        "plus": plus,
        "user": user?.toJson(),
    };
}

enum AltDescription {
    A_MOUNTAIN_WITH_A_PINK_SKY_ABOVE_THE_CLOUDS,
    CLOSEUP_PHOTO_OF_BLACK_AND_RED_BUILDING
}

final altDescriptionValues = EnumValues({
    "a mountain with a pink sky above the clouds": AltDescription.A_MOUNTAIN_WITH_A_PINK_SKY_ABOVE_THE_CLOUDS,
    "closeup photo of black and red building": AltDescription.CLOSEUP_PHOTO_OF_BLACK_AND_RED_BUILDING
});

enum BlurHash {
    LL_LF_2_W_BAX_NFHFKJ_I_W_W_BOF,
    LT_J_TJ_EYJ_FJ_LOV_RJA_CX_BB_WC
}

final blurHashValues = EnumValues({
    "LlLf,=%2WBax}nfhfkj[^iW.WBof": BlurHash.LL_LF_2_W_BAX_NFHFKJ_I_W_W_BOF,
    "LtJ@tjEyjFj[lov~Rja{-Cx]bbWC": BlurHash.LT_J_TJ_EYJ_FJ_LOV_RJA_CX_BB_WC
});

enum Color {
    C0_D9_D9,
    F3_C0_C0
}

final colorValues = EnumValues({
    "#c0d9d9": Color.C0_D9_D9,
    "#f3c0c0": Color.F3_C0_C0
});

enum Id {
    F_MUI_VEIN7_NG,
    V_EK_ISV_DVI_SS
}

final idValues = EnumValues({
    "fMUIVein7Ng": Id.F_MUI_VEIN7_NG,
    "VEkIsvDviSs": Id.V_EK_ISV_DVI_SS
});

enum CoverPhotoSlug {
    A_MOUNTAIN_WITH_A_PINK_SKY_ABOVE_THE_CLOUDS_V_EK_ISV_DVI_SS,
    CLOSEUP_PHOTO_OF_BLACK_AND_RED_BUILDING_F_MUI_VEIN7_NG
}

final coverPhotoSlugValues = EnumValues({
    "a-mountain-with-a-pink-sky-above-the-clouds-VEkIsvDviSs": CoverPhotoSlug.A_MOUNTAIN_WITH_A_PINK_SKY_ABOVE_THE_CLOUDS_V_EK_ISV_DVI_SS,
    "closeup-photo-of-black-and-red-building-fMUIVein7Ng": CoverPhotoSlug.CLOSEUP_PHOTO_OF_BLACK_AND_RED_BUILDING_F_MUI_VEIN7_NG
});

class FluffyTopicSubmissions {
    Blue? architectureInterior;
    Blue? colorOfWater;
    Blue? wallpapers;
    Blue? nature;

    FluffyTopicSubmissions({
        this.architectureInterior,
        this.colorOfWater,
        this.wallpapers,
        this.nature,
    });

    factory FluffyTopicSubmissions.fromJson(Map<String, dynamic> json) => FluffyTopicSubmissions(
        architectureInterior: json["architecture-interior"] == null ? null : Blue.fromJson(json["architecture-interior"]),
        colorOfWater: json["color-of-water"] == null ? null : Blue.fromJson(json["color-of-water"]),
        wallpapers: json["wallpapers"] == null ? null : Blue.fromJson(json["wallpapers"]),
        nature: json["nature"] == null ? null : Blue.fromJson(json["nature"]),
    );

    Map<String, dynamic> toJson() => {
        "architecture-interior": architectureInterior?.toJson(),
        "color-of-water": colorOfWater?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "nature": nature?.toJson(),
    };
}

enum Subtitle {
    DOWNLOAD_FREE_BACKGROUNDS,
    DOWNLOAD_FREE_WALLPAPERS
}

final subtitleValues = EnumValues({
    "Download Free Backgrounds": Subtitle.DOWNLOAD_FREE_BACKGROUNDS,
    "Download Free Wallpapers": Subtitle.DOWNLOAD_FREE_WALLPAPERS
});

enum Title {
    HD_WALLPAPERS,
    HQ_BACKGROUND_IMAGES
}

final titleValues = EnumValues({
    "HD Wallpapers": Title.HD_WALLPAPERS,
    "Hq Background Images": Title.HQ_BACKGROUND_IMAGES
});

enum TypeEnum {
    LANDING_PAGE,
    SEARCH
}

final typeEnumValues = EnumValues({
    "landing_page": TypeEnum.LANDING_PAGE,
    "search": TypeEnum.SEARCH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
