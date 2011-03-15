Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzSGl-0004yF-Tm for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 12:18:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FBGoBg017473
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 11:16:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17450-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 11:16:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FBGjPe017467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 11:16:45 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300183818.git.Martin.Jansa@gmail.com>
References: <cover.1300183818.git.Martin.Jansa@gmail.com>
Date: Tue, 15 Mar 2011 11:16:37 +0000
Message-ID: <1300187797.30423.1561.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PULL][PATCH 0/3] util-linux: Cleanup of unused files
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
X-List-Received-Date: Tue, 15 Mar 2011 11:18:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 11:12 +0100, Martin Jansa wrote:
> Remove files not used in SRC_URI
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: jansa/util-linux
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/util-linux
> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (3):
>   util-linux: remove unused files from files directory
>   util-linux: remove unused files from util-linux-2.17.2 directory
>   util-linux: move remaining files from files directory to
>     util-linux-2.17.2 for faster lookup

Merged to master, thanks.

Richard



