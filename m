Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWV8a-00040K-LX for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:34:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FSEkW031035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 15:28:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30424-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 15:28:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FS25Y031023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 15:28:03 GMT
Message-ID: <1322839692.18900.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Dec 2011 15:28:12 +0000
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] 3 patches: lzo, libxfont, distro_tracking_fields.inc
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
X-List-Received-Date: Fri, 02 Dec 2011 15:34:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-02 at 11:26 +0800, Dexuan Cui wrote:
> The following changes since commit 9d6790c4409dee4d08fe6a47450125c406d0ba32:
> 
>   cooker.py: Allow the -e option to work with virtual classes and -b (2011-12-01 23:14:05 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/distro
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro
> 
> Dexuan Cui (3):
>   libxfont: remove the unused no-scalable-crash.patch
>   lzo: remove the uncessary autoconf.patch
>   distro_tracking_fields.inc: update the info

Merged to master, thanks.

Richard



