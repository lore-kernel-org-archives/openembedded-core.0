Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 880866D305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:14:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2CDEKSj014027; Wed, 12 Mar 2014 13:14:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id arcyI7wX8jYy; Wed, 12 Mar 2014 13:14:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2CDE923014022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 12 Mar 2014 13:14:13 GMT
Message-ID: <1394630043.19455.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhu Yanjun <yanjun.zhu@windriver.com>
Date: Wed, 12 Mar 2014 06:14:03 -0700
In-Reply-To: <1394617589-29064-1-git-send-email-yanjun.zhu@windriver.com>
References: <1394617589-29064-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libparted: make sure not to treat percentages as exact
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
X-List-Received-Date: Wed, 12 Mar 2014 13:14:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-12 at 17:46 +0800, Zhu Yanjun wrote:
> ---
>  ...ke-sure-not-to-treat-percentages-as-exact.patch |   22 ++++++++++++++++++++
>  meta/recipes-extended/parted/parted_3.1.bb         |    3 ++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch

There is no long log in the commit message (why is this patch
important?) and no Upstream-Status in the patch.

Cheers,

Richard


