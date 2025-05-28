package com.ruoyi.common.core.redis;

import java.util.Collection;
import java.util.concurrent.TimeUnit;

/**
 * packageName: com.ruoyi.common.core.redis
 *
 * @author: idpeng
 * @version: 1.0
 * @interfaceName: IRedisCache
 * @date: 2025/5/27 12:16
 * @description: 从RedisCache中提取相关的方法出来成接口
 */
public interface IRedisCache {
    Collection<String> keys(final String pattern);

    <T> void setCacheObject(final String key, final T value);

    <T> void setCacheObject(final String key, final T value, final Integer timeout, final TimeUnit timeUnit);

    boolean expire(final String key, final long timeout, final TimeUnit unit);

    Boolean hasKey(String key);

    <T> T getCacheObject(final String key);

    boolean deleteObject(final String key);

    boolean deleteObject(final Collection collection);
}
