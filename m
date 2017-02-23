Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDB772F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1N4Dcce012041; Thu, 23 Feb 2017 04:13:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tYOpyBwWD8Cd; Thu, 23 Feb 2017 04:13:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1N4DTlZ012038
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Feb 2017 04:13:33 GMT
Message-ID: <1487823209.9663.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Fabio Berton
	<fabio.berton@ossystems.com.br>, Armin Kuster <akuster808@gmail.com>
Date: Wed, 22 Feb 2017 20:13:29 -0800
In-Reply-To: <CAP9ODKoCu930C64Yd5Gw+u5L+9A0PBBGnpr3R88t11AQN=nLjw@mail.gmail.com>
References: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
	<CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
	<7be95a90-ca8f-c107-ec6a-537fe80720bc@ossystems.com.br>
	<CAP9ODKoCu930C64Yd5Gw+u5L+9A0PBBGnpr3R88t11AQN=nLjw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: libbsd-overlay.pc: Set Cflags to use -I instead of -isystem
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
X-List-Received-Date: Thu, 23 Feb 2017 04:13:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-22 at 20:45 -0300, Otavio Salvador wrote:
> On Wed, Feb 22, 2017 at 3:51 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > 
> > Hi!
> > 
> > We need to backport this commit to morty.
> Indeed; adding Richard on Cc.

Armin is the person you need...

Cheers,

Richard

