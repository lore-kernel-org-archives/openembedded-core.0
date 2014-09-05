Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F241713C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 08:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8584I4Y032653; Fri, 5 Sep 2014 09:04:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QPJwur1rqEqt; Fri,  5 Sep 2014 09:04:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8584EGA032650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 5 Sep 2014 09:04:16 +0100
Message-ID: <1409904255.12482.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Fri, 05 Sep 2014 09:04:15 +0100
In-Reply-To: <54092B32.501@windriver.com>
References: <54092B32.501@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Integrate texinfo-4.8 to oe-core
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
X-List-Received-Date: Fri, 05 Sep 2014 08:04:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-09-05 at 11:17 +0800, Rongqing Li wrote:
> Hi:
>     I would like to integrate texinfo-4.8 into oe-core,  it was
> released on 2007, and too old, but it is a GPLv2 package. Does
> anyone objects?

With things that are this old, I'm wondering if its not time we started
a dedicated layer for the old GPLv2 versions...

Cheers,

Richard


