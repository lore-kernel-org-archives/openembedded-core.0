Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T62Ct-0007eI-4x
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 18:30:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7RGIFBj017027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2012 09:18:15 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 27 Aug 2012 09:18:15 -0700
Date: Mon, 27 Aug 2012 11:17:54 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120827111754.484c8b28@e6410-2>
In-Reply-To: <1345664364.3907.137.camel@ted>
References: <cover.1345573717.git.peter.seebach@windriver.com>
	<511616ed1761453ec1323aa945c559ca6cafffd1.1345573717.git.peter.seebach@windriver.com>
	<50350A1B.4060505@intel.com> <1345664364.3907.137.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] runqemu-export-rootfs and friends: don't put pseudo db in target fs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 16:30:31 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 22 Aug 2012 20:39:24 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> I'd wondered about this too. Can you use <dirname>.pseudo_state to
> make the list sort better and help people with tab completion and so
> on? :)

This is even BETTER. And since my previous submission had a Hilarious
Typo in it, I'll revise with this too.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


