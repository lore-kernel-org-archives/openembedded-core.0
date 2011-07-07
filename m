Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QentV-0002bn-Vv for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:41:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CbZvc027853
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:37:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27474-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 13:37:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CbPE3027847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:37:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310036935.git.paul.eggleton@linux.intel.com>
References: <cover.1310036935.git.paul.eggleton@linux.intel.com>
Date: Thu, 07 Jul 2011 13:36:48 +0100
Message-ID: <1310042209.20015.823.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Re-enable ipv4 features in busybox
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
X-List-Received-Date: Thu, 07 Jul 2011 12:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 12:10 +0100, Paul Eggleton wrote:
> The following changes since commit 465692552eae360e9053df1fd26a2e24f21785c1:
> 
>   tinylogin: use angstrom mirror for SRC_URI (2011-07-07 11:27:28 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/busybox-ipv4
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/busybox-ipv4
> 
> Paul Eggleton (2):
>   default-distrovars.inc: add ipv4 to DISTRO_FEATURES
>   busybox: bump PR to ensure ipv4 is enabled

Merged to master, thanks.

Richard



