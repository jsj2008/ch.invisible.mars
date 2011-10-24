//
//  IEShapeObject.m
//  InvisibleEngine
//
//  Created by Raphael Stäbler on 26.09.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "IEShapeObject.h"

@implementation IEShapeObject

@synthesize shapeNode = _shapeNode;
@synthesize shaderController = _shaderController;
@synthesize textureController = _textureController;
@synthesize geometryController = _geometryController;

- (id)initWithGeometryNamed:(NSString *)geometryName andShaderNamed:(NSString *)shaderName
{
    self = [super init];
    
    _shapeNode = [[IEShapeNode alloc] init];
    
    self.transformationController = [[IETransformationController alloc] initForShapeNode:_shapeNode];
    _geometryController = [[IEGeometryController alloc] initGeometryNamed:geometryName forShapeNode:_shapeNode];
    _shaderController = [[IEShaderController alloc] initShaderNamed:shaderName forShapeNode:_shapeNode];
    
    [_shapeNode setupVertexBuffer];
    
    return self;
}

- (id)initWithGeometryNamed:(NSString*)geometryName andShaderNamed:(NSString*)shaderName andTextureNamed:(NSString *)textureName
{
    self = [super init];
    
    _shapeNode = [[IEShapeNode alloc] init];
    
    self.transformationController = [[IETransformationController alloc] initForShapeNode:_shapeNode];
    _geometryController = [[IEGeometryController alloc] initGeometryNamed:geometryName forShapeNode:_shapeNode];
    _shaderController = [[IEShaderController alloc] initShaderNamed:shaderName forShapeNode:_shapeNode];
    _textureController = [[IETextureController alloc] initTextureNamed:textureName forShapeNode:_shapeNode];
    
    [_shapeNode setupVertexBuffer];
    [_shapeNode setupTexture];
    
    return self;
}

- (id)initAsInstanceOfObject:(IEShapeObject*)object
{
    self = [super init];
    
    _shapeNode = [[IEShapeNode alloc] init];
    
    self.transformationController = [[IETransformationController alloc] initForShapeNode:_shapeNode];
    
    _geometryController = object.geometryController;
    _shaderController = object.shaderController;
    _textureController = object.textureController;
    
    _shapeNode.geometry = _geometryController.geometry;
    _shapeNode.shader = _shaderController.shader;
    _shapeNode.texture = _textureController.texture;
    
    return self;
}

- (void)copyTransformationOfObject:(IEShapeObject *)object
{
    self.transformationController = object.transformationController;
}

- (void)copyOnceTransformationOfObject:(IEShapeObject *)object
{
    self.transformationController.transformation.matrix = object.transformationController.transformation.matrix;
}

@end