Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 624F260017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 18:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t75IX7YR021806; Wed, 5 Aug 2015 19:33:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WdgoaatMYYht; Wed,  5 Aug 2015 19:33:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t75IXExV021835
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 5 Aug 2015 19:33:29 +0100
Message-ID: <1438799594.9838.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: He Zhe <zhe.he@windriver.com>
Date: Wed, 05 Aug 2015 13:33:14 -0500
In-Reply-To: <55C1D2CF.4010308@windriver.com>
References: <cover.1438679154.git.zhe.he@windriver.com>
	<55C1D2CF.4010308@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: bruce.ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/1] Yocto Bug #6945
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
X-List-Received-Date: Wed, 05 Aug 2015 18:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-05 at 17:09 +0800, He Zhe wrote:
> Ping.

Sending these out daily is going to annoy me, please stop doing that.

As mentioned in other emails, I'm travelling at the moment, other people
are on vacation (including Bruce) and we're struggling in the patch
review and merging, not least due to the other autobuilder failures.
This patch is changing a lot of important code and if we screw this up,
will annoy a lot of people. It therefore needs careful review which we
will get to as soon as we can.

Cheers,

Richard


