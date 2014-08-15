Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0F670D54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F9kqPN019849 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:46:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zlRUuSZ0mRgG
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:46:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F9kot6019846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:46:51 +0100
Message-ID: <1408096010.21596.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 10:46:50 +0100
In-Reply-To: <1408023055.22187.98.camel@ted>
References: <1408023055.22187.98.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: [PATCH] e2fsprogs: 1.42.9 -> 1.42.11
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
X-List-Received-Date: Fri, 15 Aug 2014 09:46:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 14:30 +0100, Richard Purdie wrote:
> Patches were all merged upstream.

They were but they're not in 1.42.11 :( I'd messed up reading the rather
odd merge history in the upstream git repo. I've put this on ice until
we can upgrade to a version where those patches are available. They
*are* in master branch upstream.

Cheers,

Richard



