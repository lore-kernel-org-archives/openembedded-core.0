Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdGh-0005YH-9A for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:44:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDevSq020721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDeo9a020715
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8e42cc4c6a96394988e32d8f8be3ca10c13724ac.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
	<8e42cc4c6a96394988e32d8f8be3ca10c13724ac.1310405202.git.otavio@ossystems.com.br>
Date: Tue, 12 Jul 2011 14:40:49 +0100
Message-ID: <1310478049.20015.1046.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/5] libarchive: remove undistributable copyright content from source
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
X-List-Received-Date: Tue, 12 Jul 2011 13:44:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 17:27 +0000, Otavio Salvador wrote:
> The original tarball has two undistributable files that we have
> removed from the repacked tarball. The issue has been reported
> upstream at:
> 
> http://code.google.com/p/libarchive/issues/detail?id=162
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


Merged to master, thanks.

Richard



