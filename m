Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiP63-0002ew-P7 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 12:33:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BQ976017909
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 11:26:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16259-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 11:26:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BPx4Y017903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 11:26:00 GMT
Message-ID: <1325676359.3555.129.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 11:25:59 +0000
In-Reply-To: <cover.1325640149.git.josh@linux.intel.com>
References: <cover.1325640149.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Minor fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 11:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 17:31 -0800, Joshua Lock wrote:
> A couple of small patches created in the course of putting together a point
> release for Yocto 1.1.
> 
> Cheers,
> Joshua
> 
> The following changes since commit de679a3036ebef1c7d7b8ee23f05590c95e498d9:
> 
>   pseudo: ensure libs are included in package (2012-01-03 12:10:59 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/stuff
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff
> 
> Joshua Lock (2):
>   linux-tools: add binutils to perf DEPENDS
>   cogl: ensure we can build on armv4

Merged to master, thanks.

Richard



