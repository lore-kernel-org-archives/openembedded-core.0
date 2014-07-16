Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3E56705A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 22:50:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GMobbJ027223; Wed, 16 Jul 2014 23:50:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ikO6d14FKzLO; Wed, 16 Jul 2014 23:50:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GMoVj2027219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 23:50:32 +0100
Message-ID: <1405551026.3668.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 23:50:26 +0100
In-Reply-To: <CAJTo0LbGMb_v-aUQ2JHJcAxRr3qY39JcUmS+ziY21N+oTeyNiw@mail.gmail.com>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
	<53386c9bab6af2fd79b9816e82566b220a1e99ae.1405527926.git.richard.purdie@linuxfoundation.org>
	<CAJTo0LbGMb_v-aUQ2JHJcAxRr3qY39JcUmS+ziY21N+oTeyNiw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/19] python-scons: Upgrade 2.3.0 -> 2.3.2
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
X-List-Received-Date: Wed, 16 Jul 2014 22:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-16 at 23:30 +0100, Burton, Ross wrote:
> On 16 July 2014 17:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ad8a74a10870caa5e08a3e45d719e2"
> 
> Why did the checksum change?

Gah, I did check but forgot to put it in the log. It was the copyright
year.

Cheers,

Richard



