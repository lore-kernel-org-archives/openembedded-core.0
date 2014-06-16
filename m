Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB4C6AF35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:43:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GDhbUL014472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:43:37 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 06:43:37 -0700
Message-ID: <539EF487.9030601@windriver.com>
Date: Mon, 16 Jun 2014 21:43:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1401154373.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1401154373.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] meta: fixes dbus-native and cups
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
X-List-Received-Date: Mon, 16 Jun 2014 13:43:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Ping.

// Robert

On 05/27/2014 09:39 AM, Robert Yang wrote:
> The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:
>
>    guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib rbt/twofixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/twofixes
>
> Robert Yang (2):
>    dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
>    cups: enable cups-str4402.patch
>
>   meta/recipes-core/dbus/dbus.inc     |    2 ++
>   meta/recipes-extended/cups/cups.inc |    1 +
>   2 files changed, 3 insertions(+)
>

