Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4D03731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:28:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T3T0kC022564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 20:29:00 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 28 Jun 2016 20:28:59 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1467170719.git.hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5773407A.4080607@windriver.com>
Date: Wed, 29 Jun 2016 11:28:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1467170719.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1]l3afpad: Use distro_features_check for gtk+3
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
X-List-Received-Date: Wed, 29 Jun 2016 03:29:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This fix is duplicated with Joe Slater's "l3afpad: add check for 
GTK3DISTROFEATURES"

Please drop this one.

//Hongxu

On 2016年06月29日 11:26, Hongxu Jia wrote:
> The following changes since commit 13eb4a832b533f84001fca8be960ad1e58fc823f:
>
>    gst-player: upgrade to latest HEAD (2016-06-27 14:08:43 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib hongxu/fix-l3afpad
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-l3afpad
>
> Hongxu Jia (1):
>    l3afpad: Use distro_features_check for gtk+3
>
>   meta/recipes-sato/l3afpad/l3afpad_git.bb | 3 +++
>   1 file changed, 3 insertions(+)
>


