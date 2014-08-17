Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11C906FC4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8vgR2019082; Sun, 17 Aug 2014 09:57:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ayyhi8FdmxM8; Sun, 17 Aug 2014 09:57:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8vd3V019079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 17 Aug 2014 09:57:40 +0100
Message-ID: <1408265859.24858.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Aug 2014 09:57:39 +0100
In-Reply-To: <20140816181947.GA3660@jama>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
	<1407600483-31215-5-git-send-email-Martin.Jansa@gmail.com>
	<20140816181947.GA3660@jama>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] piglit: add dependency on libxrender
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
X-List-Received-Date: Sun, 17 Aug 2014 08:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-08-16 at 20:19 +0200, Martin Jansa wrote:
> On Sat, Aug 09, 2014 at 06:08:00PM +0200, Martin Jansa wrote:
> > * fixes floating dependency:
> >   piglit/piglit/latest lost dependency on  libxrender
> 
> ping

This didn't apply cleanly which is likely why it didn't get applied last
time. I've fixed it up.

Cheers,

Richard


