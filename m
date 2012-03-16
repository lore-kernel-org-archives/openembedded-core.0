Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8aGb-000189-K7
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:44:37 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Mar 2012 09:35:48 -0700
Received: by gglu1 with SMTP id u1so6449180ggl.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 09:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=GzzM7YWFplR+lAb3aXI2eDYLqutWW6wWJZsFRlw5HlA=;
	b=I2IXCZVpkKlJ0xSyWyZ50he7tH/mJ/liyxUbtVbdLxN8wWHoFeRdBbysAqdAKGGlTH
	FvO+9zGLJ+Xce7cGBr99yGw/2lDbNL7aATNd23Z26OX0NnEG4XMrxI643rbffjbRaf4R
	EUq2X9rgL2GesQvrwsyh/iIe6p7TWXNiercZZHjE+0i3P95nM/w2yqmwdGCMpsQJ99FZ
	ORkZNDSgxBbuDQR6d8hTWWZGD8tlgK1OvIMN9P4ClPHn/j740qsSrWKDBQxh7osjDQHC
	5gPdEfD19C3yjxMZ5k1mwy/whlgmfMj5woLb2EE5TU/N0HdJyrfk8lDx3i3DRYoKUfep
	r9rA==
Received: by 10.68.220.10 with SMTP id ps10mr16288167pbc.94.1331915746937;
	Fri, 16 Mar 2012 09:35:46 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id z1sm4626292pbc.38.2012.03.16.09.35.44
	(version=SSLv3 cipher=OTHER); Fri, 16 Mar 2012 09:35:45 -0700 (PDT)
Message-ID: <4F636BEE.8040807@intel.com>
Date: Fri, 16 Mar 2012 09:35:58 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331914572.git.scott.a.garman@intel.com>
	<08f07a7e59d7568f7588574b17a71d9852d1ef89.1331914572.git.scott.a.garman@intel.com>
In-Reply-To: <08f07a7e59d7568f7588574b17a71d9852d1ef89.1331914572.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQkClda40QnFXJhXiUdq4+MWA94LRuJMDaSG431Kub7rAOuXpbjRYJF8S2K5qXiYxJ1Z9fGH
Subject: Re: [PATCH 2/2] distro_tracking: updates for upgraded recipes and manual checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 16:44:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 09:19 AM, Scott Garman wrote:
> Updates for upgraded recipes e2fsprogs and ...?

Whoops, just rebased my tree to eliminate that typo at the end.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


