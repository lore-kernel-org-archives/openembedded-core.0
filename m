Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RDk93-0000pS-LW; Tue, 11 Oct 2011 23:45:53 +0200
Received: by qadc1 with SMTP id c1so47234qad.6
	for <multiple recipients>; Tue, 11 Oct 2011 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=NRyzlXc5mDamT5v9AK+2TL1eTUHLKnyF1KKDo6KAIg0=;
	b=JC/+U5LHodjP0CwyR0gqgHA3Er/V+oikNrYd4Ss4h5h7AUQn3NQO4ClnYz+ONp6kf4
	oz5+yiUl/J7tWOBqJdwVelKVxs0lgV5AuXS724NSnUMQRwFFJqgG2pUpN1yZIkGSQ8+m
	mw66phcK+ydR+Jt43gfyIzjV6GAUClpJ9TtDg=
Received: by 10.68.28.4 with SMTP id x4mr48899265pbg.56.1318369210207; Tue, 11
	Oct 2011 14:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 11 Oct 2011 14:39:40 -0700 (PDT)
In-Reply-To: <1318361177.3726.1.camel@mattotaupa>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<1318361177.3726.1.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Oct 2011 14:39:40 -0700
Message-ID: <CAMKF1spJMNhsANhzLyrr20WZAKAEscskNJgoWYCCUBgft-ZrSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] git server move
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
X-List-Received-Date: Tue, 11 Oct 2011 21:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 12:26 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Cliff,
>
>
> Am Dienstag, den 11.10.2011, 15:11 -0400 schrieb Cliff Brake:
>> Hi, we are moving git.openembedded.org to a new server.
>
> is there more information about the reasons? Is it just a new machine?
> Where is it hosted now?

Its just a new machine at same space. This is a 64bit instance all OE servi=
ces
are being moved to this server and the old instance will be decommissioned.

>
>> SSH access on the old server has been disabled. =C2=A0git:// still works=
 there.
>>
>> As soon as DNS propagates, SSH access will work with the new server.
>>
>> Let me know if you see any problems.
>>
>> SSH keys will likely change, so expect messages about that.
>
> So what are the fingerprints of the new keys? ;-)
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


