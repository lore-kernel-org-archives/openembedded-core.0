Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RzrIu-0007n5-85 for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 16:06:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LEwc3I014428
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:58:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13344-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:58:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LEwSwL014421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:58:29 GMT
Message-ID: <1329836307.20261.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 14:58:27 +0000
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Misc tidy-ups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 15:06:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-14 at 13:22 +0000, Paul Eggleton wrote:
> The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:
> 
>   guile: fix cross configure failure (2012-02-10 13:38:16 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/fixes12
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes12
> 
> Paul Eggleton (4):
>   scripts/bitbake: pass through debug options to initial pseudo build
>   conf/bitbake.conf: remove Opie definitions
>   classes/sdl: remove Opie-specific desktop file/packaging
>   stat: remove NATIVE_INSTALL_WORKS

Merged to master, thanks.

Richard



