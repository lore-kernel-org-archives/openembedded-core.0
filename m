Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RVQBk-0000ZF-2j
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:05:44 +0100
Received: by vcbfo13 with SMTP id fo13so2965936vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=eQFYv03PYKMTnDgeOz9R9+k2QvgUwoslwuo0pfdNpoY=;
	b=f071Yk+1VVN/nb2Gmb2bhb5BI6S7EhJvArYKhE07p8dxUbRmUT8DtPjh2SEAAtsXZp
	bpDbFRhtugEKKK1daHOyOwtOHAJCc8824fmgxdFzS67mM9M5MgyC5mqs2P0Rw0qNT/vC
	FVcGCZWo2JQvKXFauksvW62vMsBRP570zwGWg=
Received: by 10.220.150.212 with SMTP id z20mr6120649vcv.58.1322582341263;
	Tue, 29 Nov 2011 07:59:01 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.93.47 with HTTP; Tue, 29 Nov 2011 07:58:41 -0800 (PST)
In-Reply-To: <4ED4FEB9.4010704@linux.intel.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<4ED4FEB9.4010704@linux.intel.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Tue, 29 Nov 2011 15:58:41 +0000
X-Google-Sender-Auth: uAj0SIGSzrreXHYgXXW5Csh5YUo
Message-ID: <CAKZ=5EU9M+ncN8L-t3gKaax2Kwj-mZCwhnO_mD4GkvFRmWB5HQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Tue, 29 Nov 2011 16:05:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 3:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Julian,
>
> Thanks for your patience, this is merged into OE-Core
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>

Saul, I believe you applied the wrong version of the patch.
According to:
http://git.openembedded.org/openembedded-core/commit/?id=3D99e295ef30ba02db=
3966c66619807c037ef5089f

This is v2 instead of v3.

--=20
Julian


