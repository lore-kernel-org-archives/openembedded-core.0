Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CACAF6BCD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 20:23:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7SKNWkQ021809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 13:23:32 -0700 (PDT)
Received: from [128.224.146.246] (128.224.146.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 28 Aug 2013 13:23:31 -0700
Message-ID: <521E5C42.3070504@windriver.com>
Date: Wed, 28 Aug 2013 16:23:30 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Rongqing Li
	<rongqing.li@windriver.com>
References: <cover.1377568883.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1377568883.git.rongqing.li@windriver.com>
X-Originating-IP: [128.224.146.246]
Subject: Re: [PATCH 0/1]libnfsidmap: Add and modify idmapd.conf
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
X-List-Received-Date: Wed, 28 Aug 2013 20:23:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-26 10:07 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> The following changes since commit 58d05c817cf3be071c66c7e4dbbb9942fd7a0752:
>
>    xdg-utils: add runtime dependency on xprop (2013-08-23 16:08:30 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/libnfsidmap
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/libnfsidmap
>
> Zhang Xiao (1):
>    libnfsidmap: Add and modify idmapd.conf
>
>   .../nfs-utils/files/Set_nobody_user_group.patch      |   18 ++++++++++++++++++
>   .../nfs-utils/libnfsidmap_0.25.bb                    |    7 +++++++
>   2 files changed, 25 insertions(+)
>   create mode 100644 meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch
>


It has only been a day and a half but was this missed?


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

