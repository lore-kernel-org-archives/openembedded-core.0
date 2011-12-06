Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RY09d-0000E3-5X; Tue, 06 Dec 2011 19:54:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6IlNEW006077;
	Tue, 6 Dec 2011 18:47:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04958-08; Tue,  6 Dec 2011 18:47:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6IlCw8006071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Dec 2011 18:47:15 GMT
Message-ID: <1323197242.19363.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 18:47:22 +0000
In-Reply-To: <cover.1323148082.git.sgw@linux.intel.com>
References: <cover.1323148082.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 0/2] Small fixes (could be for M1)
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
X-List-Received-Date: Tue, 06 Dec 2011 18:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-05 at 22:16 -0800, Saul Wold wrote:
> Richard,
> 
> These are a couple of things I found in distro_tracking (with
> Jiajun's help) and wget was pointing to the wrong place, would
> be good for the self-hosted build.
> 
> Sau!
> 
> The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:
> 
>   libsdl: Disable pulseaudio explicitly (2011-12-05 23:03:23 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (2):
>   distro_tracking: fix manual entries
>   wget: Fix wget alternative path to be /usr/bin not /bin

Merged to master, thanks.

Richard



