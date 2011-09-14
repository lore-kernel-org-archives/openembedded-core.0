Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3d06-0001ym-Qp for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:06:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8E07jqT011786 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:07:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cl5OHayKwrkg
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:07:45 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8E07fbJ011770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 01:07:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 01:01:30 +0100
In-Reply-To: <1315958207.2252.22.camel@scimitar>
References: <cover.1315956050.git.sgw@linux.intel.com>
	<3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
	<1315958207.2252.22.camel@scimitar>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315958498.25993.7.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libzypp: move package-manger to it own package
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
X-List-Received-Date: Wed, 14 Sep 2011 00:06:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 16:56 -0700, Joshua Lock wrote:
> On Tue, 2011-09-13 at 16:41 -0700, Saul Wold wrote:
> > [YOCTO #1234]
> 
> Aside/nitpick: I really hate this being the first line.

I have to admit I don't like it either but it is what the commit
guidelines suggest. I have wondered about proposing to change them but
haven't had time...

Cheers,

Richard



