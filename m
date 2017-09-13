Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3BC7868F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:56:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8DKuAlM016455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Sep 2017 21:56:12 +0100
Message-ID: <1505336170.18640.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Wed, 13 Sep 2017 21:56:10 +0100
In-Reply-To: <0367e0b1-b1a0-1ef9-3448-7f567c2ca0f3@windriver.com>
References: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
	<1505315706-8937-2-git-send-email-mark.hatle@windriver.com>
	<CAP9ODKofch41F2YHW4TB==fN8KKUFiEPuPD9C1_agABc3JwOnQ@mail.gmail.com>
	<0367e0b1-b1a0-1ef9-3448-7f567c2ca0f3@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 20:56:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-09-13 at 13:42 -0500, Mark Hatle wrote:
> On 9/13/17 12:57 PM, Otavio Salvador wrote:
> > 
> > On Wed, Sep 13, 2017 at 12:15 PM, Mark Hatle <mark.hatle@windriver.
> > 
> > Couldn't package.bbclass one to be dropped?
> > 
> > 
> Yes, I didn't do it at present because I was worried it could affect
> someone and
> it's after feature freeze.
> 
> If RP is not concerned about this, I can create a V2 that also
> removes the piece
> of package.bbclass.

I'm ok with this.

Cheers,

Richard

