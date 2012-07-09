Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoKYc-0002JR-6Q
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:27:46 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 13:16:35 -0700
Received: by qcmv28 with SMTP id v28so6559015qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=624Hq+PNv1qLQqkdeM0XUY9qzfVW5XpLhSnovz4us94=;
	b=jZD6HBdAelhy+YVo8JWQMnhi3+Gh3b6gVTGXfMtTtFvyI/0UX/U71cgGEprSu3oJRp
	qP/k4CVRdSOovhzxuAo3kWX2TFNuOb0NpxaBDPnEa+y17KRLKbNC0mpmNZuxaf6hSN5s
	B4iTgMS7yF9k3IzKQAGDhbjlFnaXBRkAo6HaPkFSVo115ZsdKUKnUouv8azYlirOLHGx
	ppFrjmdhVZOS74DGaDxh2KctOmZBOdWmeQAC7YkYS4RLF7QgkbdV5RsSKqdzIZ12EpN4
	EVTC1Ewi+OYahuo4qMi2zxhaulccJ8r1sUqyy1tFSfljm5oFNiazSffGGCPGLcNPQMYE
	YgLQ==
Received: by 10.229.112.3 with SMTP id u3mr22114047qcp.50.1341864994168; Mon,
	09 Jul 2012 13:16:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Mon, 9 Jul 2012 13:16:13 -0700 (PDT)
In-Reply-To: <20120709200357.GG6308@jama.jama.net>
References: <20120709160054.C9FA610219@opal>
	<20120709200357.GG6308@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2012 21:16:13 +0100
Message-ID: <CAJTo0LZBrgFmeJVV1RfA+N4z6t=vBip7PzA0bVjk=gBrzAQqGA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkdsPoXmvaxhwe3o1DQpiPnapkuT4BHL5tdu4wHtynLuGMjBs/F99jRrYNYZbX1Hhlym7eU
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Mon, 09 Jul 2012 20:27:46 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2012 21:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> Ross: please make sure you add them in future patches
> sgw: maybe you're using different flow then RP for merging patches, but
> your SOB should be there too IMHO.

I *always* forget, sorry.  Is there a way to make git do it automatically?...

Ross


