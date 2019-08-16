Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id ACE926B07E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:37:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id m24so4442328ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 00:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=5g/DHyLUP4kRRZ43igMitwXckVwvgfeFnP7i32hFbOA=;
	b=Q/2niLdQo1bXuF2oNM0TyalgCBr7sW+kdUY61+4CDe2iTX9zrZY9Yo+ixu6reLFqQJ
	qsu0Iq9pQvaCCcdRg37tOmeH8dpCigieWGryiafdE5X0/PJPmPPHTmZUEiCdDMh0rMk/
	DTqAL9cAzAGTF6PY8/qA3lTFiwGjeDCfOcWrNNHvp0BmvmXS4eVCE9g2vS7szYHLajPq
	sFHO7OJbKtbpipFWyoz9IkD2tdWhcYE7cekvZVu+3181iK/oeuQM1p3X4PXZ+HjsS6Un
	zQjcA8XpsMFEE3b6NYrqsggfZrlcvZcXHEKLDi0mxBxO27EOBmzJYNwv3NzfefPNTsH1
	B5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=5g/DHyLUP4kRRZ43igMitwXckVwvgfeFnP7i32hFbOA=;
	b=TktVQ+Cmtrhwh1wMbgeodP63c6AQN29o2xmhpacqF0oN+6mF3fm8OUILT1HUI2Cw/n
	xS4UP1dA6KQs7MYyCtwD/BhxzfTrOfD1P+jL+7lD2qpq24Q6kH1tV5DbhBXlWdLGAUSG
	ayfti6xwZM4cp0iUNMn2475HyrYFvdXmOP50xNI/nsIEPzfOxhHcuSGSY3837e5NP67f
	LbeYfkqbb3InkpFDyDdXSv2eoe5M9fffQl7fnxN3+mfBKXHRFo3pnV3/pVFEiJBFC0t2
	P53gGHkVMm9RnjDOX8FMUOASgtyu1jUmeFz78PX59jYqEEC199H/kJoGQGB3DIm6V+zF
	gtNw==
X-Gm-Message-State: APjAAAVROEiui7saecoFOQ1Nnp63romNVLZhWD4ZuuIdanQxRJ5S9mA+
	ZNaWEWbZTV8hwOU4DiiBpsK7hDFWoMRsDXGp++CUJLlY
X-Google-Smtp-Source: APXvYqyeV3x0QSynLeRv6BxdV3wAkVN4WELto+P88QZQngqCWYnPgvKFMbEnG9sehwCibEcTnGzOjzQ7Ug6uTi/eFa0=
X-Received: by 2002:a2e:b4d4:: with SMTP id r20mr4747556ljm.5.1565941041988;
	Fri, 16 Aug 2019 00:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyWeiJA+3ahU1cdDi5kh6qTVvTi7CCNo5qzOA9_ti2vCw@mail.gmail.com>
In-Reply-To: <CAP71WjyWeiJA+3ahU1cdDi5kh6qTVvTi7CCNo5qzOA9_ti2vCw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 16 Aug 2019 09:37:10 +0200
Message-ID: <CAP71WjxRwFni-yjPepwqBkk=77UwN0kaMdxNCz==Y2_28e67VQ@mail.gmail.com>
To: Yocto list discussion <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: LF Community Bridge Mentorship
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
X-List-Received-Date: Fri, 16 Aug 2019 07:37:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi there.
just a reminder!
cheers

On Tue, Jul 30, 2019 at 4:46 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Dear all,
>
> The Community Bridge platform was launched earlier this year by the
> Linux Foundation. It=E2=80=99s a set of services available to LF projects=
 to
> help them build stronger ecosystems, and foster developers
> relationship within their respective communities. See [1] and [2]. The
> Yocto Project has joined the Community Bridge Funding and Mentorship
> programs.
>
> If you have any specific questions about these programs, please do not
> hesitate to reach out to me.
>
> Today, we would like to talk more about the mentorship program. We
> have tried several initiatives in the past about interns and
> mentorship, and we would like to do that again using the new LF
> platform. A mentorship program for the Yocto Project is a good
> opportunity for our overall community to reach out to new developers,
> improve our developers diversity. It will help increase the pool of
> available developers with appropriate skills about the Yocto Project
> and Open Embedded technologies and as a consequence create a more
> sustainable ecosystem around the Yocto Project. It also offers
> existing senior developers the chance to become mentors, and share
> their knowledge!
>
> We would like to request feedback about how to best define the Yocto
> Project Mentorship program.
>
> The structure of the mentorship is flexible and we can adjust as
> needed. Our initial thought is to set 12-week project, which is what
> the Linux Kernel Mentorship program is using, see [4]. The overall
> process involves:
>
> 1. Finding / defining work items for potential mentees.
> 2. Get appropriate funding for mentees=E2=80=99 stipends
> 3. Recruit mentors within our community
> 4. Review and select mentees=E2=80=99 applications
>
> There has already been some work on the potential work items in the
> form of the newcomer bugs, some of which could be turned into work
> suitable for a mentorship programme.
>
> =3D=3D=3D Call for ACTION =3D=3D=3D
>
> * We need your help for any of the items above, and especially #1 to
> get started. Whether you are a long time contributor to the project or
> you recently joined our mailing list, your feedback will be greatly
> appreciated.
> * If you are interested to participate as a mentor, please let me know!
> * You don=E2=80=99t need to be a project expert to be a mentor, you need =
to
> know how the project works and be willing to help guide someone
> through their task.
>
> There is no specific timeline set yet, it will most likely depend on
> how much feedback we receive about this initiative, but most likely
> the internships will have to be tied to the Yocto Project release
> timeline.
>
> If you have any questions or any suggestions, please reach out to me!
> cheers,
> Nico
>
> [1] https://www.linuxfoundation.org/press-release/2019/03/the-linux-found=
ation-launches-new-communitybridge-platform-to-help-sustain-open-source-com=
munities/
> [2] https://communitybridge.org/
> [3] https://people.communitybridge.org/
> [4] https://wiki.linuxfoundation.org/lkmp

