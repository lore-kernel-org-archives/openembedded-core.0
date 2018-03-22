Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5852478817
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 04:58:52 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id z190so4496707vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=r1R/MfdIsXDu7WqUH5MswWUCe5riBu/VXgNSVBdC3ls=;
	b=Ezs3gbwkQycKZFykvqbH4hNK+2rZCmMUkvPm2ACmqvG44uQwxkgsR/fmddGkUw9AV+
	ToLRv0EzscbiT9BHAXnNL0SMKsZysCPMqQ8m09LWwP1yWvN1VveR9nB+fILqJAqpLQyZ
	M9ga7TwDPIf6iCsDOIpgnNvj+gZeltDp8Lam2kFZPx0fT26i++enEMk0WOQSBotgFnxS
	w5l575TIshrVDzAR0nvjl2NspPOs+jAxecr0UpvwHDLQ7Upwlev3Ngi7DT1P12dCbR4M
	amDW1c1qMdoT1SVvB7ly8NZ3iphUeK6Vibx5T2ujubtsvnZrny+WGlqlAyY8qqgGxosp
	idnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=r1R/MfdIsXDu7WqUH5MswWUCe5riBu/VXgNSVBdC3ls=;
	b=AHJcJvY8T+l4t0/ppAsGSzIvpUZUBvHP+STyhbkcWVbEnxzm+d5ZuxKRG21nTzUM8D
	td15kmGKzhfILNd7Jcf0xSGQZUZ0ynbNaf2ToUDkg+5xNrP3QGOpCO7hJTn3LoMswOaw
	T/hB6pgtC28ZFoDoYyYNqYVW+tGuepQe0IJ6L9pCZ4UyJkJexso3KbwP1GyolYPijUxi
	FLhliBo80ZP53GpB4G85u07NLukM1ZpWK/a4oWZJBC4mpcE2Nq6Q8sKeNM1V48wi2pdC
	pkIF5kS2S9TbDR+YA/rPS1ml9sKBq28oa77fTJBUG7Si5tpyIPBOLPhxkHR0rRpxx9Y4
	Wb9A==
X-Gm-Message-State: AElRT7ECQwOew/hUde3HVvVSh5GsiOo2i7zollG5RAqBijzhPS2m7FV1
	tOrmGLAjHMT+YB0AtV9i3W5OjMGOFK7UwEzt8kJ5qA==
X-Google-Smtp-Source: AG47ELsTcUSp6S+VgBHm6p12FOatBHdE5lnsRkRSW6JRprxWXoc1HYWN/ZwbnGH3jPIC4I8X/8yUkyHqcYzSXifDAsU=
X-Received: by 10.31.198.131 with SMTP id w125mr14739575vkf.158.1521694733962; 
	Wed, 21 Mar 2018 21:58:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 21:58:53 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 10:28:53 +0530
Message-ID: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: package inclusion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 04:58:53 -0000
Content-Type: multipart/alternative; boundary="001a114db6c21314540567f92a67"

--001a114db6c21314540567f92a67
Content-Type: text/plain; charset="UTF-8"

Can i install tensorflow and h5py (since they are not there as recipes)
using Internet on yocto? (just the way they are installed on ubuntu or
other host OS)

Thanks

--001a114db6c21314540567f92a67
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Can i install tensorflow and h5py (since they are not there as recipes) using Internet on yocto? (just the way they are installed on ubuntu or other host OS)<br><br></div>Thanks<br></div>

--001a114db6c21314540567f92a67--
