Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdGW-0005X4-BW for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:44:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDel08020712
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20598-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDebT4020706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:40:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E1B37F1.2020504@mentor.com>
References: <cover.1310405202.git.otavio@ossystems.com.br>
	<20c3ca693fdd81de50e817ff64ada90a4bf71ade.1310405202.git.otavio@ossystems.com.br>
	<4E1B37F1.2020504@mentor.com>
Date: Tue, 12 Jul 2011 14:40:36 +0100
Message-ID: <1310478036.20015.1044.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/5] cmake: update to 2.8.5 release
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
X-List-Received-Date: Tue, 12 Jul 2011 13:44:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 10:50 -0700, Tom Rini wrote:
> On 07/11/2011 10:27 AM, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |   11 +++--------
> >  meta/recipes-devtools/cmake/cmake_2.8.5.bb        |   11 +++--------
> >  2 files changed, 6 insertions(+), 16 deletions(-)
> 
> Since this also fixed a little license problem (older versions shipped
> some unused Windows build fragments that were marked as proprietary)
> we've noticed:
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>

Merged to master, thanks.

Richard




