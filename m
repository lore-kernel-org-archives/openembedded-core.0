Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C05277DC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:39:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8B1dDTI007158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 18:39:13 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 10 Sep 2017 18:39:11 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1504673600.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2be5bc6d-25e6-f67b-b1eb-12c3febffb81@windriver.com>
Date: Mon, 11 Sep 2017 09:44:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1504673600.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 0/2] python3-pip & python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Mon, 11 Sep 2017 01:39:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/06/2017 12:54 PM, Chen Qi wrote:
> The following changes since commit 8b4f16a9cbbaf521461f699b7264fac2ac872581:
>
>    mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05 15:01:02 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/python3-nativesdk
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python3-nativesdk
>
> Chen Qi (2):
>    python3-pip: extend to nativesdk
>    python3-setuptools: extend to nativesdk
>
>   meta/recipes-devtools/python/python3-pip_9.0.1.bb         | 2 +-
>   meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>


