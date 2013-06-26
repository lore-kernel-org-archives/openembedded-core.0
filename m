Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8096041E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 03:28:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q3SAJF005967
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 20:28:10 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 25 Jun 2013 20:28:08 -0700
Message-ID: <51CA5F8E.9070504@windriver.com>
Date: Wed, 26 Jun 2013 11:27:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1371621343.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 26 Jun 2013 03:28:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Ping for this one.

// Robert

On 06/19/2013 05:00 PM, Robert Yang wrote:
> The following changes since commit 590010a6525b0e1bc1de73e794764e23404591df:
>
>    core-image-weston: add weston-examples to the image (2013-06-18 17:33:17 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/newline
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/newline
>
> Robert Yang (3):
>    package_rpm.bbclass: make DESCRIPTION support newline
>    package_ipk.bbclass: make DESCRIPTION support newline
>    package_deb.bbclass: make DESCRIPTION support newline
>
>   meta/classes/package_deb.bbclass |    5 +++--
>   meta/classes/package_ipk.bbclass |    5 +++--
>   meta/classes/package_rpm.bbclass |   19 ++++++++++++++-----
>   3 files changed, 20 insertions(+), 9 deletions(-)
>

